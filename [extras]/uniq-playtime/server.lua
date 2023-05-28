local playTime = {}
local framework = nil
local Query = {
    FETCH_TIMEESX = 'SELECT {identifierTable}, firstname, lastname, playTime FROM `{userTable}`',
    FETCH_TIMEQB = 'SELECT {identifierTable}, charinfo, playTime FROM `{userTable}`',
    UPDATE_TIME = 'UPDATE `{userTable}` SET playTime = playTime + ? WHERE {identifierTable} = ?',
    MY_TIME = 'SELECT playTime FROM `{userTable}` WHERE {identifierTable} = ?',
    FIRST_SELECT = 'SELECT playTime from `{userTable}`',
    INSERT = [[ALTER TABLE {userTable} ADD playTime INT(255) DEFAULT 0;]]
}
local ESX, QBCore
local cfg = Shared
local Locales = cfg.Locales

do
    if GetResourceState('es_extended'):find('start') then 
        framework = 'esx'
        ESX = exports['es_extended']:getSharedObject()
    end
    
    if GetResourceState('qb-core'):find('start') then 
        framework = 'qb'
        QBCore = exports['qb-core']:GetCoreObject()
    end
end


AddEventHandler('onResourceStart', function(name)
    if cache.resource == name then

        if GetNumPlayerIndices() == 0 then return end

        while framework == nil do
            Wait(0)
        end

        if framework == 'esx' then
            for k,v in pairs(ESX.GetExtendedPlayers()) do
                playTime[v.identifier] = os.time()
            end
        end

        if framework == 'qb' then
            for k,v in pairs(QBCore.Players) do
                playTime[v.PlayerData.citizenid] = os.time()
            end
        end
    end
end)

CreateThread(function()
    if framework == 'esx' then
        AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
            local identifier = xPlayer.identifier
            playTime[identifier] = os.time()
        end)
    end

    if framework == 'qb' then
        RegisterNetEvent('QBCore:Server:PlayerLoaded', function(xPlayer)
            local identifier = xPlayer.PlayerData.citizenid
            playTime[identifier] = os.time()
        end)
    end
end)


CreateThread(function()
    local userTable, identifierTable
    if framework == 'esx' then
        userTable = 'users'
        identifierTable = 'identifier'
    elseif framework == 'qb' then
        userTable = 'players'
        identifierTable = 'citizenid'
    end

    for k,v in pairs(Query) do
        Query[k] = v:gsub('{userTable}', userTable):gsub('{identifierTable}', identifierTable)
    end

    local success, result = pcall(MySQL.scalar.await, Query.FIRST_SELECT)
    
    if not success then
        MySQL.query(Query.INSERT)
        if cfg.print then
            print(('^5Adding %s column to %s table^0'):format('playTime', userTable))
        end
    end
end)

RegisterCommand(cfg.commands.mytime, function(source)
    if source == 0 then return end

    if framework == 'esx' then
        local src = source
        local identifier = ESX.GetPlayerFromId(src).identifier
        local mytime = MySQL.prepare.await(Query.MY_TIME, {identifier})
        local newTime = (os.time() - playTime[identifier]) + mytime
        TriggerClientEvent('uniq-playtime:mytime', src, newTime)
    end

    if framework == 'qb' then
        local src = source
        local identifier = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
        local mytime = MySQL.prepare.await(Query.MY_TIME, {identifier})
        local newTime = (os.time() - playTime[identifier]) + mytime
        TriggerClientEvent('uniq-playtime:mytime', src, newTime)
    end
end)


RegisterCommand(cfg.commands.timelist, function(source)
    if framework == 'esx' then
        local options = {}
        local time = MySQL.query.await(Query.FETCH_TIMEESX)

        for i = 1, #time do
            local data = time[i]
            local time

            if playTime[data.identifier] then
                time = (os.time() - playTime[data.identifier]) + data.playTime
            else
                time = data.playTime
            end

            options[#options + 1] = {
                name = ('%s %s'):format(data.firstname, data.lastname),
                playtime = time
            }
        end

        table.sort(options, function(a, b)
            return a.playtime > b.playtime
        end)
        
        TriggerClientEvent('uniq-playtime:list', source, options)
    elseif framework == 'qb' then
        local options = {}
        local data = MySQL.query.await(Query.FETCH_TIMEQB)
        local info = json.decode(data[1].charinfo)
        local name = ('%s %s'):format(info.firstname, info.lastname)
        local time

        if playTime[data[1].citizenid] then
            time = (os.time() - playTime[data[1].citizenid]) + data[1].playTime
        else
            time = data[1].playTime
        end

        for i = 1, #data do
            local data = data[i]

            options[#options + 1] = {
                name = name,
                playtime = time
            }
        end

        table.sort(options, function(a, b)
            return a.playtime > b.playtime
        end)

        TriggerClientEvent('uniq-playtime:list', source, options)
    end
end)

AddEventHandler('onResourceStop', function(name)
    if cache.resource == name then
        if GetNumPlayerIndices() == 0 then return end

        local insertTable = {}

        for k,v in pairs(playTime) do
            insertTable[#insertTable + 1] = {(os.time() - v), k}
        end

        MySQL.prepare(Query.UPDATE_TIME, insertTable)
        playTime, insertTable = {}, {}
    end
end)



AddEventHandler('playerDropped', function(reason)
    local playerId = source
    if not playerId then return end
    
    if framework == 'esx' then
        local identifier = ESX.GetPlayerFromId(playerId).identifier
  
        if identifier then
            if playTime[identifier] then
                local new_time = os.time() - playTime[identifier]
                if cfg.print then
                    print(Locales[4]:format(GetPlayerName(playerId), new_time))
                end
                MySQL.update(Query.UPDATE_TIME, {new_time, identifier})
                playTime[identifier] = nil
            end
        end
    end
    
    if framework == 'qb' then
        local identifier = QBCore.Functions.GetPlayer(playerId).PlayerData.citizenid
  
        if identifier then
            if playTime[identifier] then
                local new_time = os.time() - playTime[identifier]
                if cfg.print then
                    print(Locales[4]:format(GetPlayerName(playerId), new_time))
                end
                MySQL.update(Query.UPDATE_TIME, {new_time, identifier})
                playTime[identifier] = nil
            end
        end
    end
end)    
