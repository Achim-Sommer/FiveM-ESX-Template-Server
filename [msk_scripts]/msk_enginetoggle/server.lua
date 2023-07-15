if Config.Framework:match('ESX') then
	ESX = exports["es_extended"]:getSharedObject()

	if Config.AdminCommand.enable then
		ESX.RegisterCommand(Config.AdminCommand.command, Config.AdminCommand.groups, function(xPlayer, args, showError)
			xPlayer.triggerEvent('msk_enginetoggle:Engine', true)
		end, false, {help = 'Start the Engine as Admin'})
	end
end

if Config.Command.enable then
	RegisterCommand(Config.Command.command, function(source)
		TriggerClientEvent('msk_enginetoggle:Engine', source)
	end)
end

RegisterNetEvent('msk_enginetoggle:addcarkeys')
AddEventHandler('msk_enginetoggle:addcarkeys', function(plate)
    exports["VehicleKeyChain"]:AddTempKey(source, plate)
	Config.Notification(source, Translation[Config.Locale]['hotwiring_foundkey'])
end)

if Config.enableLockpick and Config.Framework:match('ESX') then
	ESX.RegisterUsableItem(Config.LockpickItem, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)

		TriggerClientEvent('msk_enginetoggle:hotwire', source)
	end)

	ESX.RegisterServerCallback('msk_enginetoggle:getGroup', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		cb(xPlayer.group)
	end)

	RegisterNetEvent('msk_enginetoggle:delhotwire')
	AddEventHandler('msk_enginetoggle:delhotwire', function()
		local xPlayer = ESX.GetPlayerFromId(source)

		if Config.RemoveLockpickItem then
			xPlayer.removeInventoryItem(Config.LockpickItem, 1)
		end
	end)

	RegisterNetEvent('msk_enginetoggle:hasItem')
	AddEventHandler('msk_enginetoggle:hasItem', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local hasItem = xPlayer.getInventoryItem(Config.LockpickItem).count

		if hasItem > 0 then
			TriggerClientEvent('msk_enginetoggle:hotwire', source)
		else
			Config.Notification(source, Translation[Config.Locale]['hasno_lockpick'])
		end
	end)
end

if Config.SaveSteeringAngle then
	savedAngles = {}

	RegisterServerEvent("msk_enginetoggle:async")
	AddEventHandler("msk_enginetoggle:async", function(vehNetId, angle)
		savedAngles[vehNetId] = angle
		TriggerClientEvent("msk_enginetoggle:syncanglesave", -1, vehNetId, savedAngles[vehicle])
	end)

	RegisterServerEvent("msk_enginetoggle:angledelete")
	AddEventHandler("msk_enginetoggle:angledelete", function(vehNetId)
		savedAngles[vehNetId] = nil
	end)

	CreateThread(function()
		while true do
			local sleep = Config.RefreshTime * 1000

			for i, data in pairs(savedAngles) do
				if savedAngles[i] then
					local vehicle = NetworkGetEntityFromNetworkId(i)

					if DoesEntityExist(vehicle) then
						TriggerClientEvent("msk_enginetoggle:syncanglesave", -1, i, savedAngles[i])
					else
						savedAngles[i] = nil
					end
				end
			end

			Wait(sleep)
		end
	end)
end

GithubUpdater = function()
	GetCurrentVersion = function()
		return GetResourceMetadata( GetCurrentResourceName(), "version" )
	end

	local CurrentVersion = GetCurrentVersion()
	local resourceName = "^4["..GetCurrentResourceName().."]^0"
	local VehicleKeyChain = "^3[VehicleKeyChain]^0"

	if Config.VersionChecker then
		PerformHttpRequest('https://raw.githubusercontent.com/Musiker15/msk_enginetoggle/main/VERSION', function(Error, NewestVersion, Header)
			print("###############################")
			if CurrentVersion == NewestVersion then
				print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
				if Config.VehicleKeyChain then
					if (GetResourceState("VehicleKeyChain") == "started") then
						print('^2[READY]^0 Script '.. VehicleKeyChain ..' found!')
					elseif (GetResourceState("VehicleKeyChain") == "stopped") then
						print('^1[ERROR]^0 Script '.. VehicleKeyChain ..' not found! Please be sure, that '.. VehicleKeyChain ..' is started.')
					end
				end
			elseif CurrentVersion ~= NewestVersion then
				print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
				print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: ^9https://github.com/Musiker15/msk_enginetoggle/releases/tag/v'.. NewestVersion .. '^0')
				if Config.VehicleKeyChain then
					if (GetResourceState("VehicleKeyChain") == "started") then
						print('^2[READY]^0 Script '.. VehicleKeyChain ..' found!')
					elseif (GetResourceState("VehicleKeyChain") == "stopped") then
						print('^1[ERROR]^0 Script '.. VehicleKeyChain ..' not found! Please be sure, that '.. VehicleKeyChain ..' is started.')
					end
				end
			end
			print("###############################")
		end)
	else
		print("###############################")
		print(resourceName .. '^2 ✓ Resource loaded^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
		print("###############################")
	end
end
GithubUpdater()