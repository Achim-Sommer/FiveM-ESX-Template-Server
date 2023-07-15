local GPS = {}

AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() == resource then
		for job, v in pairs(Config.allowedJobs) do
			GPS[job] = {}
		end
	end
end)

if Config.Commands.gps.enable then
	RegisterCommand(Config.Commands.gps.command, function(source, args, rawCommand)
		ESX.UseItem(source, Config.GPS.item)
	end)
end

if Config.Panicbutton.item.enable then
	ESX.RegisterUsableItem(Config.Panicbutton.item.item, function(source)
		togglePanicbutton(source)
	end)
end

RegisterNetEvent('msk_jobGPS:togglePanicbutton')
AddEventHandler('msk_jobGPS:togglePanicbutton', function()
	local src = source
	togglePanicbutton(src)
end)

RegisterNetEvent('msk_jobGPS:notifyNearestPlayers')
AddEventHandler('msk_jobGPS:notifyNearestPlayers', function(playerId)
	Config.Notification(playerId, 'The Player has activated the Panicbutton')
end)

togglePanicbutton = function(source)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local canUseItem = false

	if not isAllowed(xPlayer, 'panic') then return end
	if Config.Panicbutton.item.enable then
		local hasItem = xPlayer.getInventoryItem(Config.Panicbutton.item.item)

		if hasItem and hasItem.count > 0 then canUseItem = true end
	else
		canUseItem = true
	end

	if not GPS[xPlayer.job.name][xPlayer.source] then canUseItem = false end
	if not canUseItem then return Config.Notification(src, 'Panicbutton does not work now') end

	local xPlayers = ESX.GetExtendedPlayers('job', xPlayer.job.name)
	for k, xTarget in pairs(xPlayers) do
		if GPS[xTarget.job.name][xTarget.source] and xTarget.source ~= xPlayer.source then
			xTarget.triggerEvent('msk_jobGPS:activatePanicbutton', xPlayer)
			Config.Notification(xTarget.source, xPlayer.name .. ' activated the Panicbutton')
		end
	end
end

ESX.RegisterUsableItem(Config.GPS.item, function(source)
	local src = source
   	local xPlayer = ESX.GetPlayerFromId(src)

	if not isAllowed(xPlayer, 'gps') then return end

	if GPS[xPlayer.job.name][xPlayer.source] then
		Config.Notification(src, 'GPS deactivated')
		xPlayer.triggerEvent('msk_jobGPS:deactivateGPS')
		removeBlipById(xPlayer)
	else
		local playerPed = GetPlayerPed(xPlayer.source)

		GPS[xPlayer.job.name][xPlayer.source] = {
			xPlayer = xPlayer,
			netId = NetworkGetNetworkIdFromEntity(playerPed),
			coords = GetEntityCoords(playerPed),
			heading = math.ceil(GetEntityHeading(playerPed))
		}

		Config.Notification(src, 'GPS activated')
   		xPlayer.triggerEvent('msk_jobGPS:activateGPS', GPS)
	end
end)

RegisterNetEvent('esx:playerLogout', function(source)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	removeBlipById(xPlayer)
end)

RegisterNetEvent('esx:playerDropped', function(playerId, reason)
	local src = playerId
	local xPlayer = ESX.GetPlayerFromId(src)

	removeBlipById(xPlayer)
end)

RegisterNetEvent("esx:setJob", function(playerId, newJob, oldJob)
	if newJob.name == oldJob.name then return end
	local src = playerId
	local xPlayer = ESX.GetPlayerFromId(src)

	Config.Notification(src, 'GPS deactivated')
	xPlayer.triggerEvent('msk_jobGPS:deactivateGPS')
	removeBlipById(xPlayer)
end)

RegisterNetEvent('msk_jobGPS:setDeath')
AddEventHandler('msk_jobGPS:setDeath', function()
	local src = source
   	local xPlayer = ESX.GetPlayerFromId(src)

	Config.Notification(src, 'GPS deactivated')
	xPlayer.triggerEvent('msk_jobGPS:deactivateGPS')
	removeBlipById(xPlayer)
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	if item == Config.GPS.item then
		xPlayer.triggerEvent('msk_jobGPS:deactivateGPS')
		removeBlipById(xPlayer)
	end
end)

CreateThread(function()
    while true do
        local sleep = Config.GPS.refresh * 1000

		-- New Way to refresh PlayerData
		for job, players in pairs(GPS) do
			for playerId, info in pairs(players) do
                -- info = xPlayer, netId, heading
				local playerPed = GetPlayerPed(playerId)

				info.coords = GetEntityCoords(playerPed)
				info.heading = math.ceil(GetEntityHeading(playerPed))
			end
		end

		local xPlayers = ESX.GetExtendedPlayers()
		for k, xPlayer in pairs(xPlayers) do
			if GPS[xPlayer.job.name] and GPS[xPlayer.job.name][xPlayer.source] then
				TriggerClientEvent('msk_jobGPS:refreshBlips', xPlayer.source, GPS)
			end
		end

        Wait(sleep)
    end
end)

removeBlipById = function(xPlayer)
	local source, job = xPlayer.source, xPlayer.job.name

	if GPS[job] and GPS[job][source] then 
		GPS[job][source] = nil

		for playerId, v in pairs(GPS[job]) do
			TriggerClientEvent('msk_jobGPS:deactivateGPSById', playerId, source)
		end
	end
end

isAllowed = function(xPlayer, action)
	for job, v in pairs(Config.allowedJobs) do
		if xPlayer.job.name == job then
			if action == 'gps' and v.gps then
				return true
			elseif action == 'panic' and v.panicbutton then
				return true
			end
		end
	end

	return false
end

logging = function(code, ...)
    if Config.Debug then
        local script = "[^2"..GetCurrentResourceName().."^0]"
        MSK.logging(script, code, ...)
    end
end

GithubUpdater = function()
    GetCurrentVersion = function()
	    return GetResourceMetadata( GetCurrentResourceName(), "version" )
    end
    
    local CurrentVersion = GetCurrentVersion()
    local resourceName = "^4["..GetCurrentResourceName().."]^0"

    if Config.VersionChecker then
        PerformHttpRequest('https://raw.githubusercontent.com/MSK-Scripts/msk_jobGPS/main/VERSION', function(Error, NewestVersion, Header)
            print("###############################")
            if CurrentVersion == NewestVersion then
                print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
            elseif CurrentVersion ~= NewestVersion then
                print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
                print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here:^9 https://github.com/MSK-Scripts/msk_jobGPS/releases/tag/v'.. NewestVersion .. '^0')
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