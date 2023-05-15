local PlayerPedId, GetVehiclePedIsUsing = PlayerPedId, GetVehiclePedIsUsing
CreateThread(function ()
    while true do 
        ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            _sleep = 100
            local vehiculo = GetVehiclePedIsUsing(ped)
            local velo
            if Config.UseMPH then
                velo = GetEntitySpeed(vehiculo) * 2.236936 -- Convert to mph
            else
                velo = GetEntitySpeed(vehiculo) * 3.6 -- Convert to km/h
            end
            local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehiculo)
            local gaso = GetFuelOfVehicle(vehiculo)
            local door = GetVehicleDoorLockStatus(vehiculo)
            local carhealth = GetVehicleBodyHealth(vehiculo) / 10
            SendNUIMessage({
                action = 'showCarhud',
                vel = velo,
                gasolina = gaso,
                vehicleLights = vehicleLights, 
                vehicleHighlights = vehicleHighlights, 
                vehicleGear = vehicleGear,
                carhealth = carhealth,
                mph = Config.UseMPH,
                door = door
            })
        else
            _sleep = 1000
            SendNUIMessage({
                action = 'hideCarhud'
            })
        end
        Wait(_sleep)
    end
end)
