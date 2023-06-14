local connectedPolice = 1
local robberyPlayers = {}
local isCurrentRobbery, coolDown = false, false

ESX = exports['es_extended']:getSharedObject()

-- Count Police
function CountPolice()
    local connectedPolice = 0
    local xPlayers = ESX.GetExtendedPlayers('job', 'police')

    for k, xPlayer in pairs(xPlayers) do
        connectedPolice = connectedPolice + 1
    end

    TriggerClientEvent('esx_advancedholdup:connectedPolice', -1, connectedPolice)
    SetTimeout(60000, CountPolice)
end

-- Add Command to Start Timer
ESX.RegisterCommand('robberystart', 'admin', function(xPlayer, args, showError)
	TriggerEvent('esx_advancedholdup:startTimer')
end, false, {help = 'Start Robbery Timer'})

-- Add Command to Reset Timer
ESX.RegisterCommand('robberyreset', 'admin', function(xPlayer, args, showError)
	TriggerEvent('esx_advancedholdup:resetTimer')
end, false, {help = 'Reset Robbery Timer'})

-- See if there is an On Going Robbery & Cool Down has Ended
ESX.RegisterServerCallback('esx_advancedholdup:checkRob', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if isCurrentRobbery == false and coolDown == false then
		cb(true)
	else
		--xPlayer.showNotification(_U('rob_cooldown'))
		cb(false)
	end
end)

-- Start Cool Down Timer
RegisterServerEvent('esx_advancedholdup:startTimer')
AddEventHandler('esx_advancedholdup:startTimer', function()
	coolDown = true
	SetTimeout((Config.CoolDown*60)*1000, function()
		coolDown = false
	end)
end)

-- Reset Timer
RegisterServerEvent('esx_advancedholdup:resetTimer')
AddEventHandler('esx_advancedholdup:resetTimer', function()
	coolDown = false
end)

-- Robbery Canceled
RegisterServerEvent('esx_advancedholdup:robberyCanceled')
AddEventHandler('esx_advancedholdup:robberyCanceled', function(zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	isCurrentRobbery = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_advancedholdup:robCompAtNotif', xPlayer.source, zone, false)
			TriggerClientEvent('esx_advancedholdup:removeBlip', xPlayer.source)
		end
	end

	if robberyPlayers[source] then
		robberyPlayers[source] = nil
		xPlayer.showNotification(_U('rob_cancel'))
		--TriggerClientEvent('esx:showNotification', xPlayer.source, _U('rob_cancel'))
	end
end)

-- Robbery in Progress
RegisterServerEvent('esx_advancedholdup:robInProgress')
AddEventHandler('esx_advancedholdup:robInProgress', function(mainZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	if Config.Zones[mainZone] then
		local zone = Config.Zones[mainZone]

		if isCurrentRobbery == false then
			if zone.Robbed ~= 0 and (os.time() - zone.Robbed) < zone.TimeBeforeNewRob then
				local timerNewRob = zone.TimeBeforeNewRob - (os.time() - zone.Robbed)
				xPlayer.showNotification(_U('rob_already', timerNewRob))
				--TriggerClientEvent('esx:showNotification', source, _U('rob_already', timerNewRob))
				return
			else
				if connectedPolice < zone.PoliceRequired then
					xPlayer.showNotification(_U('rob_required', zone.PoliceRequired))
					--TriggerClientEvent('esx:showNotification', source, _U('rob_required', zone.PoliceRequired))
					return
				end
			end

			isCurrentRobbery = true
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx_advancedholdup:robPoliceNotif', xPlayer.source, mainZone)
					TriggerClientEvent('esx_advancedholdup:createBlip', xPlayer.source, Config.Zones[mainZone].Coords)
				end
			end

			xPlayer.showNotification(_U('rob_started'))
			--TriggerClientEvent('esx:showNotification', source, _U('rob_started'))
			TriggerClientEvent('esx_advancedholdup:startRobTimer', source, mainZone)
			TriggerEvent('esx_advancedholdup:startTimer')

			Config.Zones[mainZone].Robbed = os.time()
			robberyPlayers[source] = mainZone
			local savedSource = source

			SetTimeout(zone.TimeToRob * 1000, function()
				if robberyPlayers[savedSource] then
					isCurrentRobbery = false
					if xPlayer then
						xPlayer.addAccountMoney('money', zone.Reward)
						TriggerClientEvent('esx_advancedholdup:robCompNotif', xPlayer.source)

						for i=1, #xPlayers, 1 do
							local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
							if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx_advancedholdup:robCompAtNotif', xPlayer.source, robberyPlayers[savedSource], true)
								TriggerClientEvent('esx_advancedholdup:removeBlip', xPlayer.source)
							end
						end
					end
				end
			end)
		else
			xPlayer.showNotification(_U('rob_in_prog'))
			--TriggerClientEvent('esx:showNotification', xPlayer.source, _U('rob_in_prog'))
		end
	end
end)

-- 
AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then	
		TriggerEvent('esx_advancedholdup:startTimer')
		return
	end
end)

CountPolice()