Config = {}

Config.UseMPH = false -- If true it will use mph, if false it will use km/h

Config.StatusUpdateInterval = 5000 -- Time it takes for status to update (lowering this value adds ms)

function GetFuelOfVehicle(vehicle)
   return GetVehicleFuelLevel(vehicle)
end

function GetStatus(cb)

    TriggerEvent("esx_status:getStatus", "hunger", function(h)
        TriggerEvent("esx_status:getStatus", "thirst", function(t)
            local hunger = h.getPercent()
            local thirst = t.getPercent()
            cb({hunger, thirst})
        end)
    end)

end