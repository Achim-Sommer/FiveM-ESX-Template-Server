MSK = {}

local Timeouts, RegisteredCommands, Callbacks = {}, {}, {}

AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() ~= 'msk_core' then
        print('^1Please rename the Script to^3 msk_core^0!')
        print('^1Server will be shutdown^0!')
        os.exit()
    end
end)

if Config.Framework:match('esx') then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework:match('qbcore') then
    QBCore = exports['qb-core']:GetCoreObject()
end

local Letters = {}
for i = 48,  57 do table.insert(Letters, string.char(i)) end
for i = 65,  90 do table.insert(Letters, string.char(i)) end
for i = 97, 122 do table.insert(Letters, string.char(i)) end

MSK.GetRandomLetter = function(length)
    Wait(0)
    if length > 0 then
        return MSK.GetRandomLetter(length - 1) .. Letters[math.random(1, #Letters)]
    else
        return ''
    end
end

MSK.Round = function(num, decimal) 
    return tonumber(string.format("%." .. (decimal or 0) .. "f", num))
end

MSK.Trim = function(str, bool)
    if bool then return (str:gsub("^%s*(.-)%s*$", "%1")) end
    return (str:gsub("%s+", ""))
end

MSK.Split = function(str, delimiter)
    local result = {}
    
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do 
        table.insert(result, match) 
    end 

    return result 
end

MSK.RegisterCommand = function(name, group, cb, console, framework, suggestion)    
    if type(name) == 'table' then
        for k, v in ipairs(name) do 
            MSK.RegisterCommand(v, group, cb, console, framework, suggestion)
        end
        return
    end

    if RegisteredCommands[name] then
        logging('debug', ('Command %s is already registerd. Overriding Command...'):format(name))
    end
    
    local added = addChatSuggestions(name, suggestion)
    while not added do Wait(1) end
    
    RegisteredCommands[name] = {group = group, cb = cb, console = console, suggestion = suggestion}

    RegisterCommand(name, function(source, args, rawCommand)
        local source = source
        local Command, error = RegisteredCommands[name], nil

        if not Command.console and source == 0 then 
            logging('error', 'You can not run this Command in Server Console!')
        else
            if Command.suggestion and Command.suggestion.arguments then 
                local newArgs = {}

                for k, v in ipairs(Command.suggestion.arguments) do 
                    if v.action == 'number' then
                        if args[k] then
                            if tonumber(args[k]) then
                                newArgs[v.name] = args[k]
                            else
                                error = ('Argument %s is not a number!'):format(v.name)
                            end
                        end
                    elseif v.action == 'playerId' then
                        if args[k] then
                            if tonumber(args[k]) > 0 and doesPlayerIdExist(args[k]) then
                                newArgs[v.name] = args[k]
                            else
                                error = ('PlayerId %s does not exist!'):format(args[k])
                            end
                        end
                    else
                        newArgs[v.name] = args[k]
                    end

                    if not error and not newArgs[v.name] and v.val then 
                        error = ('Argument Mismatch with Argument %s'):format(v.name)
                    end
                    if error then break end
                end

                args = newArgs
            end

            if error then
                if source == 0 then
                    logging('error', error)
                else
                    MSK.Notification(source, error)
                end
            else
                if Config.Framework:match('esx') and framework then
                    local xPlayer = ESX.GetPlayerFromId(source)
                    cb(xPlayer, args, rawCommand)
                elseif Config.Framework:match('qbcore') and framework then
                    local Player = QBCore.Functions.GetPlayer(source)
                    cb(Player, args, rawCommand)
                elseif Config.Framework:match('standalone') or not framework then
                    cb(source, args, rawCommand)
                end
            end
        end
    end, true)

    if type(group) == 'table' then
        for k, v in ipairs(group) do
            ExecuteCommand(('add_ace group.%s command.%s allow'):format(v, name))
        end
    else
        ExecuteCommand(('add_ace group.%s command.%s allow'):format(group, name))
    end
end

MSK.Notification = function(src, title, message, info, time)
    if not src or src == 0 then return end
    TriggerClientEvent('msk_core:notification', src, title, message, info, time)
end

MSK.AdvancedNotification = function(src, text, title, subtitle, icon, flash, icontype)
    if not src or src == 0 then return end
    TriggerClientEvent('msk_core:advancedNotification', src, text, title, subtitle, icon, flash, icontype)
end

MSK.AddWebhook = function(webhook, botColor, botName, botAvatar, title, description, fields, footer, time)
    local content = {}

    if footer then 
        if time then
            footer = {
                ["text"] = footer.text .. " • " .. os.date(time),
                ["icon_url"] = footer.link
            }
        else
            footer = {
                ["text"] = footer.text,
                ["icon_url"] = footer.link
            }
        end
    end

    if fields then
        content = {{
            ["title"] = title,
            ["description"] = description,
            ["color"] = botColor,
            ["fields"] = fields,
            ["footer"] = footer
        }}
    else
        content = {{
            ["title"] = title,
            ["description"] = description,
            ["color"] = botColor,
            ["footer"] = footer
        }}
    end

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = botName,
        embeds = content,
        avatar_url = botAvatar
    }), {
        ['Content-Type'] = 'application/json'
    })
end

MSK.RegisterCallback = function(name, cb)
    Callbacks[name] = cb
end

MSK.Table_Contains = function(table, value)
    if type(value) == 'table' then
        for k, v in pairs(table) do
            for k2, v2 in pairs(value) do
                if v == v2 then
                    return true
                end
            end
        end
    else
        for k, v in pairs(table) do
            if v == value then
                return true
            end
        end
    end
    return false
end

MSK.logging = function(script, code, ...)
    if code == 'error' then
        print(script, '[^1ERROR^0]', ...)
    elseif code == 'debug' then
		print(script, '[^3DEBUG^0]', ...)
	end
end

local Timeout = 0
MSK.AddTimeout = function(ms, cb)
    local requestId = Timeout + 1

    SetTimeout(ms, function()
        if Timeouts[requestId] then Timeouts[requestId] = nil return end
        cb()
    end)

    Timeout = requestId
    return requestId
end

MSK.DelTimeout = function(requestId)
    if not requestId then return end
    Timeouts[requestId] = true
end

MSK.HasItem = function(xPlayer, item)
    if not xPlayer then logging('error', 'Player on Function MSK.HasItem does not exist!') return end
    if not Config.Framework:match('esx') or Config.Framework:match('qbcore') then 
        logging('error', ('Function %s can not used without Framework!'):format('^3MSK.HasItem^0'))
        return 
    end
    local hasItem

    if Config.Framework:match('esx') then
        hasItem = xPlayer.getInventoryItem(item)
    elseif Config.Framework:match('qbcore') then
        hasItem = xPlayer.Functions.GetItemByName(item)
    else
        logging('error', 'Framework on Function MSK.HasItem is not configured!')
    end

    return hasItem
end

MSK.RegisterCallback('msk_core:hasItem', function(source, cb, item)
    local src = source
    local xPlayer

    if Config.Framework:match('esx') then
        xPlayer = ESX.GetPlayerFromId(src)
    elseif Config.Framework:match('qbcore') then
        xPlayer = QBCore.Functions.GetPlayer(src)
    end

    cb(MSK.HasItem(xPlayer, item))
end)

MSK.Comma = function(int, tag)
    if not tag then tag = '.' end
    local newInt = int

    while true do  
        newInt, k = string.gsub(newInt, "^(-?%d+)(%d%d%d)", '%1'..tag..'%2')

        if (k == 0) then
            break
        end
    end

    return newInt
end

RegisterNetEvent('msk_core:triggerCallback')
AddEventHandler('msk_core:triggerCallback', function(name, requestId, ...)
    local src = source
    if Callbacks[name] then
        Callbacks[name](src, function(...)
            TriggerClientEvent("msk_core:responseCallback", src, requestId, ...)
        end, ...)
    end
end)

doesPlayerIdExist = function(playerId)
    for k, id in pairs(GetPlayers()) do
        if id == playerId then
            return true
        end
    end
    return false
end

addChatSuggestions = function(name, suggestion)
    if RegisteredCommands[name] then
        if RegisteredCommands[name].suggestion then
            TriggerClientEvent('chat:removeSuggestion', -1, '/' .. name)
        end
    end

    if suggestion then
        if not suggestion.arguments then suggestion.arguments = {} end
        if not suggestion.help then suggestion.help = '' end
    
        TriggerClientEvent('chat:addSuggestion', -1, '/' .. name, suggestion.help, suggestion.arguments)
    end

    return true
end

logging = function(code, ...)
    local script = "[^2"..GetCurrentResourceName().."^0]"
    MSK.logging(script, code, ...)
end

GithubUpdater = function()
    GetCurrentVersion = function()
	    return GetResourceMetadata( GetCurrentResourceName(), "version" )
    end
    
    local CurrentVersion = GetCurrentVersion()
    local resourceName = "^4["..GetCurrentResourceName().."]^0"

    if Config.VersionChecker then
        PerformHttpRequest('https://raw.githubusercontent.com/MSK-Scripts/msk_core/main/VERSION', function(Error, NewestVersion, Header)
            print("###############################")
            if CurrentVersion == NewestVersion then
                print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
            elseif CurrentVersion ~= NewestVersion then
                print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
                print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here:^9 https://github.com/MSK-Scripts/msk_core/releases/tag/v'.. NewestVersion .. '^0')
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

exports('getCoreObject', function()
    return MSK
end)