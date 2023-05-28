local playerPed = PlayerPedId()
local task = 0
local petrol_can = GetHashKey("WEAPON_PETROLCAN")
local haveitem = false
local fuelt = false



Citizen.CreateThread(function()
	while true do
	Citizen.Wait(3)
	local pPed = PlayerPedId()
	local playercoord = GetEntityCoords(pPed)
	local pedWeapon = GetSelectedPedWeapon(pPed)
	local weapon = GetHashKey(Config.weapon)
	local closveh = GetClosestVehicle(playercoord.x, playercoord.y, playercoord.z, 2,0 , 7 )
	local closcar = IsThisModelACar(GetEntityModel(closveh))
	local closvehcoord = GetEntityCoords(closveh)
	local distance = #(playercoord - closvehcoord)
	if distance > 5 then
	task = 0
	end
	
		if closcar == true then
		local vehfuellevel = GetVehicleFuelLevel(closveh)
			if pedWeapon == weapon and task == 0 then
				DrawText3Ds(closvehcoord.x, closvehcoord.y, closvehcoord.z, Config.Locales.car_break)
				if IsControlJustReleased(0,47) then
					task = 1
					 FreezeEntityPosition(pPed, true)
					TaskStartScenarioInPlace(pPed, 'PROP_HUMAN_BUM_BIN', 0, true)
					local success = lib.skillCheck({'easy', 'easy', 'easy'})
						if success == true then
							task = 2
						else
							task = 0
						end
					Wait(1500)
					ClearPedTasks(pPed)
					FreezeEntityPosition(pPed, false)
				end
			end
			if task == 2 and pedWeapon ~= petrol_can then
				DrawText3Ds(closvehcoord.x, closvehcoord.y, closvehcoord.z, Config.Locales.hand_petrolcan)
			elseif task == 2 and pedWeapon == petrol_can then
				DrawText3Ds(closvehcoord.x, closvehcoord.y, closvehcoord.z, Config.Locales.start_steal)
--				DrawText3Ds(closvehcoord.x, closvehcoord.y, closvehcoord.z+0.2, Config.Locales.fuel_level ..vehfuellevel)
					if IsControlJustReleased(0,47) then
					TriggerServerEvent("hyon_stealfuel:checkitem", pPed)
					Wait(1000)
						if haveitem == true then
							FreezeEntityPosition(pPed, true)
							TaskStartScenarioInPlace(pPed, 'PROP_HUMAN_BUM_BIN', 0, true)
							local success = lib.skillCheck({'easy', 'easy', 'easy'})
							if success == true then
								TriggerServerEvent('hyon_stealfuel:steal', closveh, vehfuellevel)
								Wait(500)
								if fuelt == true then
									Entity(closveh).state.fuel = vehfuellevel-Config.stealamount
									vehfuellevel = vehfuellevel-Config.stealamount
								end
								fuelt = false
								Wait(500)
							else
								task = 2
								TriggerServerEvent('hyon_stealfuel:removehose', closveh)
							end
							Wait(1500)
							ClearPedTasks(pPed)
							FreezeEntityPosition(pPed, false)
						else
							ESX.ShowNotification(Config.Locales.noitem, "error", 3000)
						end
					end
			end
		end
	end
end)


RegisterNetEvent("hyon_stealfuel:haveitem", function(item)
	if item == true then
	haveitem = true
	else
	haveitem = false
	end
end)


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(22)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370

end

RegisterNetEvent("hyon_stealfuel:fuel", function(fueltest)
	if fueltest == true then
	fuelt = true
	else
	fuelt = false
	end
end)