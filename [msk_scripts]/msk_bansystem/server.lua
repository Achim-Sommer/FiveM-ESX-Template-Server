local bannedPlayers = {}

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    local createTable = MySQL.query.await("CREATE TABLE IF NOT EXISTS msk_bansystem (`id` int(10) NOT NULL AUTO_INCREMENT, `ids` longtext DEFAULT NULL, `time` text NULL, `reason` text NOT NULL, `bannedby` varchar(80) NOT NULL, PRIMARY KEY (`id`));")
    if createTable.warningStatus == 0 then
		logging('debug', '^2 Successfully ^3 created ^2 table ^3 msk_bansystem ^0')
	end

    local data = MySQL.query.await("SELECT * FROM msk_bansystem")
    if not data and data[1] then return end

    for k, v in pairs(data) do
        table.insert(bannedPlayers, {id = v.id, ids = json.decode(v.ids), reason = v.reason, time = v.time, from = v.bannedby})
    end
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local src = source
    local isBanned, expired = isPlayerBanned(src, playerName)

    if isBanned and not expired then
        CancelEvent()
        setKickReason(('Banned by %s until %s for %s. BanID: %s'):format(isBanned.from, isBanned.time, isBanned.reason, isBanned.id))
    elseif isBanned and expired then
        unbanPlayer(nil, isBanned.id)
    end
end)

isPlayerBanned = function(source, playerName)
    local identifiers = GetPlayerIdentifiers(source)
    local player = {}

    player['name'] = playerName or GetPlayerName(source)
    for _, v in pairs(identifiers) do
        player[split(v, ':')[1]] = v
    end

    for k, v in pairs(bannedPlayers) do
        for name, id in pairs(v.ids) do
            if player[name] and id == player[name] then
                local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+)"
                local timeToConvert = v.time
                local day, month, year, hour, minute = timeToConvert:match(pattern)
                local time = os.time({day = day, month = month, year = year, hour = hour, min = minute})
                logging('debug', os.date('%d-%m-%Y %H:%M', os.time()), os.date('%d-%m-%Y %H:%M', time))

                if os.time() < time then
                    return v
                else
                    return v, true
                end
                break
            end
        end
    end

    return false
end
exports('isPlayerBanned', isPlayerBanned)

if Config.Commands.enable then
    RegisterCommand(Config.Commands.ban, function(source, args, raw)
        local src = source
        local playerId, time, reason = args[1], args[2], args[3]

        if not playerId or not time then return end
        if not reason then reason = 'Unknown' end

        if src > 0 and isAllowed(src) then
            banPlayer(src, playerId, time, reason)
        elseif src == 0 then
            banPlayer(nil, playerId, time, reason)
        else
            Config.Notification(src, 'You don\'t have permission to do that!')
        end
    end)

    RegisterCommand(Config.Commands.unban, function(source, args, raw)
        local src = source
        local banId = args[1]

        if not banId then return end

        if src > 0 and isAllowed(src) then
            unbanPlayer(src, banId)
        elseif src == 0 then
            unbanPlayer(nil, banId)
        else
            Config.Notification(src, 'You don\'t have permission to do that!')
        end
    end)
end

isAllowed = function(source)
    for k, group in pairs(Config.Commands.groups) do
        if IsPlayerAceAllowed(source, group) then
            return true
        end
    end
    return false
end

banPlayer = function(source, playerId, time, reason)
    local playerName = GetPlayerName(playerId)

    if not playerName then 
        if source then Config.Notification(source, ('Player with ID %s not found!'):format(playerId)) end
        return logging('debug', ('Player with ^2ID %s^0 not found!'):format(playerId))
    end

    local identifiers = GetPlayerIdentifiers(playerId)
    local timestamp, banTime = formatTime(time)
    local player = {}

    player['name'] = playerName
    for _, v in pairs(identifiers) do
        player[split(v, ':')[1]] = v
    end

    local bannedby = 'System'
    if source then bannedby = GetPlayerName(source) end

    MySQL.query('INSERT INTO msk_bansystem (ids, time, reason, bannedby) VALUES (@ids, @time, @reason, @bannedby)', { 
        ['@ids'] = json.encode(player),
        ['@time'] = banTime,
        ['@reason'] = reason,
        ['@bannedby'] = bannedby
    }, function(response)
        if response then
            logging('debug', 'Player with ID ^2' .. playerId .. '^0 was banned until ^2' .. banTime .. '^0 for Reason: ^2' .. reason .. '^0. BanID: ^2' .. response.insertId .. '^0')
            if source then Config.Notification(source, 'Player with ID ' .. playerId .. ' was banned until ' .. banTime .. ' for Reason: ' .. reason .. '. BanID: ' .. response.insertId) end
            table.insert(bannedPlayers, {id = response.insertId, ids = player, reason = reason, time = banTime, from = bannedby})
            banLog(source, bannedby, playerId, banTime, reason, json.encode(player))
            DropPlayer(playerId, ('Banned by %s for %s until %s. BanID: %s'):format(bannedby, reason, banTime, response.insertId))
        end
    end)
end
exports('banPlayer', banPlayer)

unbanPlayer = function(source, banId)
    MySQL.query('DELETE FROM msk_bansystem WHERE id = @id', { 
        ['@id'] = banId
    }, function(response)
        if response.affectedRows > 0 then
            logging('debug', 'Player with BanID ^2' .. banId .. '^0 was unbanned.')
            if source then Config.Notification(source, 'Player with BanID ' .. banId .. ' was unbanned.') end

            local index
            for k, v in pairs(bannedPlayers) do
                if v.id == banID then
                    index = k
                end
            end
            table.remove(bannedPlayers, index)

            local unbannedby = 'System'
            if source then unbannedby = GetPlayerName(source) end
            unbanLog(source, unbannedby, banId)
        else
            logging('debug', 'BanID ^2' .. banId .. '^0 was not found.')
            if source then Config.Notification(source, 'BanID ' .. banId .. ' was not found.') end
        end
    end)
end
exports('unbanPlayer', unbanPlayer)

formatTime = function(time)
    local banTime = 0

    if time:find('P') then
        banTime = os.time() + (60 * 60 * 24 * 7 * 52 * 100)
    elseif time:find('M') then
        banTime = os.time() + (60 * split(time, 'M')[1])
    elseif time:find('H') then
        banTime = os.time() + (60 * 60 * split(time, 'H')[1])
    elseif time:find('D') then
        banTime = os.time() + (60 * 60 * 24 * split(time, 'D')[1])
    elseif time:find('W') then
        banTime = os.time() + (60 * 60 * 24 * 7 * split(time, 'W')[1])
    end

    return banTime, os.date('%d-%m-%Y %H:%M', banTime)
end

split = function(s, delimiter)
    local result = {}
    
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do 
        table.insert(result, match) 
    end 

    return result 
end

logging = function(code, ...)
    if not Config.Debug then return end

    local script = "[^2"..GetCurrentResourceName().."^0]"
    MSK.logging(script, code, ...)
end

GithubUpdater = function()
    GetCurrentVersion = function()
	    return GetResourceMetadata( GetCurrentResourceName(), "version" )
    end
    
    local CurrentVersion = GetCurrentVersion()
    local resourceName = "[^2"..GetCurrentResourceName().."^0]"

    if Config.VersionChecker then
        PerformHttpRequest('https://raw.githubusercontent.com/MSK-Scripts/msk_bansystem/main/VERSION', function(Error, NewestVersion, Header)
            print("###############################")
            if CurrentVersion == NewestVersion then
                print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
            elseif CurrentVersion ~= NewestVersion then
                print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
                print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here:^9 https://github.com/MSK-Scripts/msk_bansystem/releases/tag/v'.. NewestVersion .. '^0')
            end
            print("###############################")
        end)
    else
        print("###############################")
        print(resourceName .. '^2 ✓ Resource loaded^0')
        print("###############################")
    end
end
GithubUpdater()