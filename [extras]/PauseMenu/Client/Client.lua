local open = false
RegisterCommand('openSettinggmenu', function()
    OpenPauseMenu()
end)

RegisterKeyMapping('openSettinggmenu', 'Open Pause Menu', 'keyboard', 'ESCAPE')



function OpenPauseMenu()
	Wait(200)
    if not open and not IsPauseMenuActive() then
		
        SetNuiFocus(true,true)
        SendNUIMessage({
            action = 'show',
        })
        open = true
    end
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 199) then
			OpenPauseMenu()
        end
    end
end)



CreateThread(function()
    while true do 
        SetPauseMenuActive(false) 
        Wait(1)
    end
end)

RegisterNUICallback('exit', function(data, cb)
	SetNuiFocus(false, false)
	open = false
	
end)

RegisterNUICallback('SendAction', function(data, cb)
    if data.action == 'settings' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
        SetNuiFocus(false, false)
		open = false
    elseif data.action == 'map' then 

        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
        SetNuiFocus(false, false)
		open = false
	elseif data.action == 'exit' then 

        TriggerServerEvent("pausemenu:quit")
        SetNuiFocus(false, false)
		open = false
		
    end

end)


