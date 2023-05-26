local open = false
RegisterCommand('openSetting', function()
    OpenPauseMenu()
end)

RegisterKeyMapping('openSetting', 'Open Pause Menu', 'keyboard', 'ESCAPE')
TriggerEvent('chat:removeSuggestion', '/openSetting')

function OpenPauseMenu()
    if not open and not IsPauseMenuActive() then 
        SetNuiFocus(true,true)
        SendNUIMessage({
            action = 'show',
        })
        open = true
        CreationCamHead()
        GetDataFromServer()
        GetJobs()
    end
end




function GetDataFromServer()
    ESX.TriggerServerCallback("Roda_PauseMenu:Getserverdata", function(job, money, dirtymoney, bankmoney, max, total) 
		SendNUIMessage({action = "UpdateData", key = "bankmoney", value = tonumber(bankmoney)})
		SendNUIMessage({action = "UpdateData", key = "dirtymoney", value = tonumber(dirtymoney)})
        SendNUIMessage({action = "UpdateData", key = "money", value = tonumber(money)})
		SendNUIMessage({action = "UpdateData", key = "job", value = job.label.." - "..job.grade_label})
        SendNUIMessage({action = 'updatePlayers', max = max, total = total})
	end)
end


function GetJobs()
    ESX.TriggerServerCallback("Roda_PauseMenu:GetOnlineJobs", function(jobs) 
        for k,v in pairs(jobs) do 
            SendNUIMessage({
                action = 'updateJobs',
                label = v.label,
                value = v.count
            })
        end
	end)
end

CreateThread(function()
    while true do 
        SetPauseMenuActive(false) 
        Wait(10)
    end
end)

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
  open = false
  DestroyCamera()
end)

RegisterNUICallback('SendAction', function(data, cb)
    if data.action == 'settings' then 
        DestroyCamera()
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
        SetNuiFocus(false, false)
    elseif data.action == 'map' then 
        DestroyCamera()
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
        SetNuiFocus(false, false)
    end

end)


---- Code for update money and job ----

--- Your code ---


RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "bank" then
		SendNUIMessage({action = "UpdateData", key = "bankmoney", value = tonumber(account.money)})
		bankmoneys = tonumber(account.money)
    elseif account.name == "money" then
        SendNUIMessage({action = "UpdateData", key = "money", value = tonumber(account.money)})
	elseif account.name == "black_money" then
		SendNUIMessage({action = "UpdateData", key = "dirtymoney", value = tonumber(account.money)})
		dirtymoneys = tonumber(account.money)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  	SendNUIMessage({
        action = "UpdateData", 
        key = "job", 
        value = job.label.." - "..job.grade_label
    })
end)
