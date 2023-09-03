local webHookLink = "INSERT DISCORD WEBHOOK LINK HERE"

CreateThread(function()
	while true do
		local sleep = 10000
        local OnlineMedics = 0
		local xPlayers = ESX.GetExtendedPlayers()

        for k, xPlayer in pairs(xPlayers) do
            if isMedic(xPlayer.job.name) then
                OnlineMedics = OnlineMedics + 1
            end
        end

        TriggerClientEvent('msk_aimedic:refreshMedics', -1, OnlineMedics)

		Wait(sleep)
	end
end)

RegisterServerEvent('msk_aimedic:removeMoney')
AddEventHandler('msk_aimedic:removeMoney', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local cash = xPlayer.getAccount('money').money
    local account = 'money'

    if cash < Config.RevivePrice then account = 'bank' end
    xPlayer.removeAccountMoney(account, Config.RevivePrice)
    sendDiscordLog(xPlayer)
end)

ESX.RegisterServerCallback('msk_aimedic:getOnlineMedics', function(source, cb)
    local src = source
    local OnlineMedics = 0
    local xPlayers = ESX.GetExtendedPlayers()

    for k, xPlayer in pairs(xPlayers) do
        if isMedic(xPlayer.job.name) then
            OnlineMedics = OnlineMedics + 1
        end
    end

   cb(OnlineMedics)
end)

isMedic = function(playerJob)
    for k, job in pairs(Config.Jobs.jobs) do
        if job == playerJob then
            return true
        end
    end
    return false
end

comma = function(int, tag)
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

sendDiscordLog = function(xPlayer)
    if not Config.DiscordLog then return end

    local content = {{
        ["title"] = "MSK AI Medic",
        ["description"] = Translation[Config.Locale]['discord_webhook']:format(xPlayer.name, xPlayer.source),
        ["color"] = Config.botColor,
        ["footer"] = {
            ["text"] = "© MSK Scripts • " .. os.date("%d/%m/%Y %H:%M:%S"),
            ["icon_url"] = Config.botAvatar
        }
    }}

    PerformHttpRequest(webHookLink, function(err, text, headers) end, 'POST', json.encode({
        username = Config.botName,
        embeds = content,
        avatar_url = Config.botAvatar
    }), {
        ['Content-Type'] = 'application/json'
    })
end

GithubUpdater = function()
    GetCurrentVersion = function()
	    return GetResourceMetadata( GetCurrentResourceName(), "version" )
    end
    
    local CurrentVersion = GetCurrentVersion()
    local resourceName = "[^2"..GetCurrentResourceName().."^0]"

    if Config.VersionChecker then
        PerformHttpRequest('https://raw.githubusercontent.com/MSK-Scripts/msk_aimedic/main/VERSION', function(Error, NewestVersion, Header)
            print("###############################")
            if CurrentVersion == NewestVersion then
                print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
            elseif CurrentVersion ~= NewestVersion then
                print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
                print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here:^9 https://github.com/MSK-Scripts/msk_aimedic/releases/tag/v'.. NewestVersion .. '^0')
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