local food = 0
local water = 0

CreateThread(function()
    while true do 
        -- Detect if player talking
        Wait(300)
        local playerPed = PlayerPedId()
        local playerid = PlayerId()
        local pid = GetPlayerServerId(playerid)
        local talking = NetworkIsPlayerTalking(playerid)
        SendNUIMessage({
            action = 'updateTalking',
            playerTalking = talking,
            pid = pid,
            hunger = food,
            thirst = water,
        })
    end
end)


ESX = nil
Loaded = false
Citizen.CreateThread(function()	
	ESX = exports['es_extended']:getSharedObject()
	while ESX.GetPlayerData().job == nil do Wait(100) end
	Loaded = true
	ESX.TriggerServerCallback("Roda_FogHud:FirstCallBack", function(xPlayer, money, dirtymoney, bankmoney) 
		local data = xPlayer
		SendNUIMessage({action = "UpdateData", key = "bankmoney", value = tonumber(bankmoney)})
		SendNUIMessage({action = "UpdateData", key = "dirtymoney", value = tonumber(dirtymoney)})

		local job = data.job
	
		SendNUIMessage({action = "UpdateData", key = "job", value = job.label, key2 = "grado", value2 = job.grade_label})

		-- Money
		SendNUIMessage({
            action = "UpdateData", 
            key = "money", 
            value = tonumber(money)
        })
		TriggerEvent('es:setMoneyDisplay', 0.0)
		ESX.UI.HUD.SetDisplay(0.0)
	end)
end)



CreateThread(function()
    while true do
        Citizen.Wait(Config.StatusUpdateInterval)
        GetStatus(function(data)
                food = data[1]
                water = data[2]
        end)
    end
end)




RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "bank" then
		SendNUIMessage({action = "UpdateData", key = "bankmoney", value = tonumber(account.money)})
	elseif account.name == "black_money" then
		SendNUIMessage({action = "UpdateData", key = "dirtymoney", value = tonumber(account.money)})
    elseif account.name == "money" then
        SendNUIMessage({action = "UpdateData", key = "money", value = tonumber(account.money)})
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  	SendNUIMessage({
        action = "UpdateData", 
        key = "job", 
        key2 = "grado",
        value = job.label,
        value2 = job.grade_label
    })
end)


--- Support for 1.1

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(e)
	SendNUIMessage({action = "UpdateData", key = "money", value = tonumber(e)})
end)

