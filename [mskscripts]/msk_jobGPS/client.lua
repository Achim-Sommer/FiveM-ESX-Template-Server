local isActivated = false
local Blips, activeBlips = {}, {}

AddEventHandler('esx:onPlayerDeath', function(data)
    TriggerServerEvent('msk_jobGPS:setDeath')
end)

RegisterNetEvent('msk_jobGPS:activateGPS')
AddEventHandler('msk_jobGPS:activateGPS', function(GPS)
    isActivated = true
    addBlips(GPS)
end)

RegisterNetEvent('msk_jobGPS:deactivateGPS')
AddEventHandler('msk_jobGPS:deactivateGPS', function()
    isActivated = false
	removeBlips()
end)

RegisterNetEvent('msk_jobGPS:refreshBlips')
AddEventHandler('msk_jobGPS:refreshBlips', function(GPS)
    refreshBlips(GPS)
end)

RegisterNetEvent('msk_jobGPS:deactivateGPSById')
AddEventHandler('msk_jobGPS:deactivateGPSById', function(source)
    logging('debug', 'Deactivating Blip by ID')
    if not activeBlips[source] then return end

    for k, blip in pairs(Blips) do
        if activeBlips[source].blip == blip then
            table.remove(k)
        end
    end

    RemoveBlip(activeBlips[source].blip)
    activeBlips[source] = nil
end)

if Config.Commands.panicbutton.enable then
	RegisterCommand(Config.Commands.panicbutton.command, function()
		TriggerServerEvent('msk_jobGPS:togglePanicbutton')

        if Config.Panicbutton.notifyNearestPlayers then
            local players = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), 8.0)
            
            for k, player in pairs(players) do
                TriggerServerEvent('msk_jobGPS:notifyNearestPlayers', GetPlayerServerId(player))
            end
        end
	end)

    if Config.Panicbutton.hotkey.enable then
        RegisterKeyMapping(Config.Commands.panicbutton.command, 'Panicbutton', 'keyboard', Config.Panicbutton.hotkey.key)
    end
end

RegisterNetEvent('msk_jobGPS:activatePanicbutton')
AddEventHandler('msk_jobGPS:activatePanicbutton', function(xPlayer)
    if activeBlips[xPlayer.source] then SetBlipColour(activeBlips[xPlayer.source].blip, Config.Panicbutton.blipColor) end
    SetNewWaypoint(xPlayer.coords.x, xPlayer.coords.y)
end)

addBlips = function(GPS, Player, heading)
    logging('debug', 'addBlips')

    if not Player then
        for job, ids in pairs(GPS) do
            if ESX.PlayerData.job.name == job then
                for playerId, v in pairs(ids) do
                    logging('debug', job, playerId, v)
                    -- v = xPlayer, playerPed, netId, heading
                    local xPlayer = v.xPlayer

                    if ESX.PlayerData.identifier ~= xPlayer.identifier then
                        local blip = AddBlipForCoord(xPlayer.coords.x, xPlayer.coords.y, xPlayer.coords.z)

                        SetBlipSprite(blip, Config.GPS.blip.id)
                        SetBlipScale(blip, Config.GPS.blip.scale)
                        SetBlipColour(blip, Config.GPS.blip.color)

                        ShowNumberOnBlip(blip, playerId)
                        ShowHeadingIndicatorOnBlip(blip, true)
                        SetBlipRotation(blip, v.heading)

                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentString(('%s'):format(xPlayer.name))
                        EndTextCommandSetBlipName(blip)

                        table.insert(Blips, {blip = blip, source = playerId})
                        activeBlips[playerId] = {isActive = false, blip = blip}
                    end
                end
            end
        end
    else
        local xPlayer = Player
        if ESX.PlayerData.identifier == xPlayer.identifier then return end
        logging('debug', 'Add Blip for ' .. xPlayer.source)
        local blip = AddBlipForCoord(xPlayer.coords.x, xPlayer.coords.y, xPlayer.coords.z)

        SetBlipSprite(blip, Config.GPS.blip.id)
        SetBlipScale(blip, Config.GPS.blip.scale)
        SetBlipColour(blip, Config.GPS.blip.color)

        ShowNumberOnBlip(blip, xPlayer.source)
        ShowHeadingIndicatorOnBlip(blip, true)
        SetBlipRotation(blip, heading)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(('%s'):format(xPlayer.name))
        EndTextCommandSetBlipName(blip)

        table.insert(Blips, {blip = blip, source = xPlayer.source})
        activeBlips[xPlayer.source] = {isActive = false, blip = blip}
    end
end

removeBlips = function()
    logging('debug', 'removeBlips')

    for k, blip in pairs(Blips) do
        RemoveBlip(blip.blip)
    end

    Blips = {}
    activeBlips = {}
end

refreshBlips = function(GPS)
    logging('debug', 'refreshBlips')

    for job, ids in pairs(GPS) do
        if ESX.PlayerData.job.name == job then
            for playerId, v in pairs(ids) do
                -- v = xPlayer, netId, heading
                local xPlayer = v.xPlayer
                
                if ESX.PlayerData.identifier ~= xPlayer.identifier then
                    if not activeBlips[playerId] then addBlips(GPS, xPlayer, v.heading) end

                    logging('debug', 'Blip is active')
                    local inOneSync = inOneSync(v.netId)
                        
                    if inOneSync and not activeBlips[playerId].isActive then
                        logging('debug', 'inOneSync')

                        CreateThread(function()
                            activeBlips[playerId].isActive = true

                            while activeBlips[playerId] and activeBlips[playerId].isActive and DoesEntityExist(inOneSync.ped) do
                                local coords = GetEntityCoords(inOneSync.ped)
                                local heading = math.ceil(GetEntityHeading(inOneSync.ped))

                                SetBlipCoords(activeBlips[playerId].blip, coords.x, coords.y, coords.z)
                                SetBlipRotation(activeBlips[playerId].blip, heading)

                                Wait(0)
                            end
                        end)
                    elseif not inOneSync then
                        logging('debug', 'not inOneSync')
                        activeBlips[playerId].isActive = false

                        SetBlipCoords(activeBlips[playerId].blip, v.coords.x, v.coords.y, v.coords.z)
                        SetBlipRotation(activeBlips[playerId].blip, v.heading)
                    end
                end

            end
        end
	end
end

inOneSync = function(netId)
    local playerPed = NetworkDoesNetworkIdExist(netId) and NetworkGetEntityFromNetworkId(netId)

    if DoesEntityExist(playerPed) then return {ped = playerPed} end
    return false
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