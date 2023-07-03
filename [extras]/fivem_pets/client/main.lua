ESX = exports['es_extended']:getSharedObject()
local ped, model, object, animation = {}, {}, {}, {}
local status = 100
local objCoords
local come = 0
local isAttached, getball, inanimation, balle = false ,false, false, false

--https://github.com/citizenfx/fivem/blob/master/code/client/clrcore/External/PedHash.cs
Citizen.CreateThread(function()

	Citizen.Wait(5000)
	DoRequestModel(-1788665315) -- chien
	DoRequestModel(1462895032) -- cat--
	DoRequestModel(1682622302) -- loup
	DoRequestModel(-541762431) -- lapin
	DoRequestModel(1318032802) -- husky
	DoRequestModel(-1323586730) -- cochon
	DoRequestModel(1125994524) -- caniche
	DoRequestModel(1832265812) -- carlin
	DoRequestModel(882848737) -- retriever
	DoRequestModel(1126154828) -- berger
	DoRequestModel(-1384627013) -- westie
	DoRequestModel(351016938)  -- rottweiler--chop--
end)

function OpenPetMenu()
	local elements = {}
	if come == 1 then

		table.insert(elements, {label = _U('hunger', status), value = nil})
		table.insert(elements, {label = _U('givefood'), value = 'graille'})
		table.insert(elements, {label = _U('attachpet'), value = 'attached_animal'})

		if isInVehicle then
			table.insert(elements, {label = _U('getpeddown'), value = 'vehicle'})
		else
			table.insert(elements, {label = _U('getpedinside'), value = 'vehicle'})
		end

		table.insert(elements, {label = _U('giveorders'), value = 'give_orders'})

	else
		table.insert(elements, {label = _U('callpet'), value = 'come_animal'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pet_menu', {
		title    = _U('pet_management'),
		align    = 'top-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'come_animal' and come == 0 then
			ESX.TriggerServerCallback('fivem_pets:getPet', function(pet)
				if pet == 'chien' then
					model = -1788665315
					come = 1
					openchien()
				elseif pet == 'chat' then
					model = 1462895032
					come = 1
					openchien()
				elseif pet == 'loup' then
					model = 1682622302
					come = 1
					openchien()
				elseif pet == 'lapin' then
					model = -541762431
					come = 1
					openchien()
				elseif pet == 'husky' then
					model = 1318032802
					come = 1
					openchien()
				elseif pet == 'cochon' then
					model = -1323586730
					come = 1
					openchien()
				elseif pet == 'caniche' then
					model = 1125994524
					come = 1
					openchien()
				elseif pet == 'carlin' then
					model = 1832265812
					come = 1
					openchien()
				elseif pet == 'retriever' then
					model = 882848737
					come = 1
					openchien()
				elseif pet == 'berger' then
					model = 1126154828
					come = 1
					openchien()
				elseif pet == 'westie' then
					model = -1384627013
					come = 1
					openchien()
				elseif pet == 'rottweiler' then
					model = 351016938
					come = 1
				else
					print('fivem_pets: unknown pet ' .. pet)
				end
			end)
			menu.close()
		elseif data.current.value == 'attached_animal' then
			if not IsPedSittingInAnyVehicle(ped) then
				if isAttached == false then
					attached()
					isAttached = true
				else
					detached()
					isAttached = false
				end
				else
				ESX.ShowNotification(_U('dontattachhiminacar'))
			end
		elseif data.current.value == 'give_orders' then
			GivePetOrders()
		elseif data.current.value == 'graille' then
			local inventory = ESX.GetPlayerData().inventory
			local coords1   = GetEntityCoords(PlayerPedId())
			local coords2   = GetEntityCoords(ped)
			local distance  = GetDistanceBetweenCoords(coords1, coords2, true)

			local count = 0
			for i=1, #inventory, 1 do
				if inventory[i].name == 'petfood' then
					count = inventory[i].count
				end
			end
			if distance < 5 then
				if count >= 1 then
					if status < 100 then
						status = status + math.random(2, 15)
						ESX.ShowNotification(_U('gavepetfood'))
						TriggerServerEvent('fivem_pets:consumePetFood')
						if status > 100 then
							status = 100
						end
						menu.close()
					else
						ESX.ShowNotification(_U('nomorehunger'))
					end
				else
					ESX.ShowNotification(_U('donthavefood'))
				end
			else
				ESX.ShowNotification(_U('hestoofar'))
			end
		elseif data.current.value == 'vehicle' then
			local playerPed = PlayerPedId()
			local vehicle  = GetVehiclePedIsUsing(playerPed)
			local coords   = GetEntityCoords(playerPed)
			local coords2  = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(coords, coords2, true)

			if not isInVehicle then
				if IsPedSittingInAnyVehicle(playerPed) then
					if distance < 8 then
						attached()
						Citizen.Wait(200)
						if IsVehicleSeatFree(vehicle, 1) then
							SetPedIntoVehicle(ped, vehicle, 1)
							isInVehicle = true
						elseif IsVehicleSeatFree(vehicle, 2) then
							isInVehicle = true
							SetPedIntoVehicle(ped, vehicle, 2)
						elseif IsVehicleSeatFree(vehicle, 0) then
							isInVehicle = true
							SetPedIntoVehicle(ped, vehicle, 0)
						end

						menu.close()
					else
						ESX.ShowNotification(_U('toofarfromcar'))
					end

				else
					ESX.ShowNotification(_U('youneedtobeincar'))
				end
			else
				if not IsPedSittingInAnyVehicle(playerPed) then
					SetEntityCoords(ped, coords,1,0,0,1)
					Citizen.Wait(100)
					detached()
					isInVehicle = false
					menu.close()
				else
					ESX.ShowNotification(_U('yourstillinacar'))
				end
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function GivePetOrders()
	ESX.TriggerServerCallback('fivem_pets:getPet', function(pet)
		local elements = {}

		if not inanimation then
			if pet ~= 'chat' then
				table.insert(elements, {label = _U('balle'), value = 'balle'})
			end

			table.insert(elements, {label = _U('pied'),     value = 'pied'})
			table.insert(elements, {label = _U('doghouse'), value = 'return_doghouse'})

			if pet == 'chien' then
				table.insert(elements, {label = _U('sitdown'), value = 'assis'})
				table.insert(elements, {label = _U('getdown'), value = 'coucher'})
			elseif pet == 'chat' then
				table.insert(elements, {label = _U('getdown'), value = 'coucher2'})
			elseif pet == 'loup' then
				table.insert(elements, {label = _U('getdown'), value = 'coucher3'})
			elseif pet == 'carlin' then
				table.insert(elements, {label = _U('sitdown'), value = 'assis2'})
			elseif pet == 'retriever' then
				table.insert(elements, {label = _U('sitdown'), value = 'assis3'})
			elseif pet == 'rottweiler' then
				table.insert(elements, {label = _U('sitdown'), value = 'assis4'})
			end
		else
			table.insert(elements, {label = _U('getup'), value = 'debout'})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_orders', {
			title    = _U('pet_orders'),
			align    = 'top-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'return_doghouse' then
				local GroupHandle = GetPlayerGroup(PlayerId())
				local coords      = GetEntityCoords(PlayerPedId())

				ESX.ShowNotification(_U('doghouse_returning'))

				SetGroupSeparationRange(GroupHandle, 1.9)
				SetPedNeverLeavesGroup(ped, false)
				TaskGoToCoordAnyMeans(ped, coords.x + 40, coords.y, coords.z, 5.0, 0, 0, 786603, 0xbf800000)

				Citizen.Wait(5000)
				DeleteEntity(ped)
				come = 0

				ESX.UI.Menu.CloseAll()
			elseif data.current.value == 'pied' then
				local coords = GetEntityCoords(PlayerPedId())
				TaskGoToCoordAnyMeans(ped, coords, 5.0, 0, 0, 786603, 0xbf800000)
				menu.close()
			elseif data.current.value == 'balle' then
				local pedCoords = GetEntityCoords(ped)
				object = GetClosestObjectOfType(pedCoords, 190.0, GetHashKey('w_am_baseball'))

				if DoesEntityExist(object) then
					balle = true
					objCoords = GetEntityCoords(object)
					TaskGoToCoordAnyMeans(ped, objCoords, 5.0, 0, 0, 786603, 0xbf800000)
					local GroupHandle = GetPlayerGroup(PlayerId())
					SetGroupSeparationRange(GroupHandle, 1.9)
					SetPedNeverLeavesGroup(ped, false)
					menu.close()
				else
					ESX.ShowNotification(_U('noball'))
				end
			elseif data.current.value == 'assis' then -- [chien ]
				DoRequestAnimSet('creatures@rottweiler@amb@world_dog_sitting@base')
				TaskPlayAnim(ped, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'coucher' then -- [chien ]
				DoRequestAnimSet('creatures@rottweiler@amb@sleep_in_kennel@')
				TaskPlayAnim(ped, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'coucher2' then -- [chat ]
				DoRequestAnimSet('creatures@cat@amb@world_cat_sleeping_ground@idle_a')
				TaskPlayAnim(ped, 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'coucher3' then -- [loup ]
				DoRequestAnimSet('creatures@coyote@amb@world_coyote_rest@idle_a')
				TaskPlayAnim(ped, 'creatures@coyote@amb@world_coyote_rest@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'assis2' then -- [carlin ]
				DoRequestAnimSet('creatures@carlin@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(ped, 'creatures@carlin@amb@world_dog_sitting@idle_a', 'idle_b' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'assis3' then -- [retriever ]
				DoRequestAnimSet('creatures@retriever@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(ped, 'creatures@retriever@amb@world_dog_sitting@idle_a', 'idle_c' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'assis4' then -- [rottweiler ]
				DoRequestAnimSet('creatures@rottweiler@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(ped, 'creatures@rottweiler@amb@world_dog_sitting@idle_a', 'idle_c' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'debout' then
				ClearPedTasks(ped)
				inanimation = false
				menu.close()
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30)

		if balle then
			local coords1 = GetEntityCoords(PlayerPedId())
			local coords2 = GetEntityCoords(ped)
			local distance  = GetDistanceBetweenCoords(objCoords, coords2, true)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance < 0.5 then
				local boneIndex = GetPedBoneIndex(ped, 17188)
				AttachEntityToEntity(object, ped, boneIndex, 0.120, 0.010, 0.010, 5.0, 150.0, 0.0, true, true, false, true, 1, true)
				TaskGoToCoordAnyMeans(ped, coords1, 5.0, 0, 0, 786603, 0xbf800000)
				balle = false
				getball = true
			end
		end

		if getball then
			local coords1 = GetEntityCoords(PlayerPedId())
			local coords2 = GetEntityCoords(ped)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance2 < 1.5 then
				DetachEntity(object,false,false)
				Citizen.Wait(50)
				SetEntityAsMissionEntity(object)
				DeleteEntity(object)
				GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_BALL"), 1, false, true)
				local GroupHandle = GetPlayerGroup(PlayerId())
				SetGroupSeparationRange(GroupHandle, 999999.9)
				SetPedNeverLeavesGroup(ped, true)
				SetPedAsGroupMember(ped, GroupHandle)
				getball = false
			end
		end
	end
end)

function attached()
	local GroupHandle = GetPlayerGroup(PlayerId())
	SetGroupSeparationRange(GroupHandle, 1.9)
	SetPedNeverLeavesGroup(ped, false)
	FreezeEntityPosition(ped, true)
end

function detached()
	local GroupHandle = GetPlayerGroup(PlayerId())
	SetGroupSeparationRange(GroupHandle, 999999.9)
	SetPedNeverLeavesGroup(ped, true)
	SetPedAsGroupMember(ped, GroupHandle)
	FreezeEntityPosition(ped, false)
end

function openchien()
	local playerPed = PlayerPedId()
	local LastPosition = GetEntityCoords(playerPed)
	local GroupHandle = GetPlayerGroup(PlayerId())

	DoRequestAnimSet('rcmnigel1c')

	TaskPlayAnim(playerPed, 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)

	Citizen.SetTimeout(5000, function()
		ped = CreatePed(28, model, LastPosition.x +1, LastPosition.y +1, LastPosition.z -1, 1, 1)

		SetPedAsGroupLeader(playerPed, GroupHandle)
		SetPedAsGroupMember(ped, GroupHandle)
		SetPedNeverLeavesGroup(ped, true)
		SetPedCanBeTargetted(ped, false)
		SetEntityAsMissionEntity(ped, true,true)

		status = math.random(40, 90)
		Citizen.Wait(5)
		attached()
		Citizen.Wait(5)
		detached()
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(math.random(60000, 120000))

		if come == 1 then
			status = status - 1
		end

		if status == 0 then
			TriggerServerEvent('fivem_pets:petDied')
			DeleteEntity(ped)
			ESX.ShowNotification(_U('pet_dead'))
			come = 3
			status = "die"
		end
	end
end)

--[[
RegisterNetEvent("fivem_pets:openPet")
AddEventHandler("fivem_pets:openPet", function()
		OpenPetMenu()
end)
]]
	
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Config.KeyToOpen) then 
			OpenPetMenu()
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.PetShop.Pos.x, Config.Zones.PetShop.Pos.y, Config.Zones.PetShop.Pos.z)

	SetBlipSprite (blip, Config.Zones.PetShop.Sprite)
	SetBlipDisplay(blip, Config.Zones.PetShop.Display)
	SetBlipScale  (blip, 1.0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('pet_shop'))
	EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coord = GetEntityCoords(PlayerPedId())
		
		local distance = GetDistanceBetweenCoords(coord, Config.Zones.PetShop.Pos.x, Config.Zones.PetShop.Pos.y, Config.Zones.PetShop.Pos.z, true)

		if distance < Config.DrawDistance then
			DrawMarker(Config.MarkerType, Config.Zones.PetShop.Pos.x, Config.Zones.PetShop.Pos.y, Config.Zones.PetShop.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
		end
		
		if distance < 2 then
			ESX.ShowHelpNotification(_U('enterkey'))
			if IsControlJustReleased(0, 38) then
				OpenPetShop()
			end
		end
	end
end)

RegisterNUICallback('NUIFocusOff', function(data)
	SetNuiFocus(false, false)
end)

RegisterNUICallback('animal_buy', function(data)
	if tonumber(data.price) > 0 then
		ESX.TriggerServerCallback('fivem_pets:buyPet', function(boughtPed)
			if boughtPed then
				
			end
		end, data.pet, data.label, tonumber(data.price))
	end
end)

function OpenPetShop()
	for i=1, #Config.PetShop, 1 do
		SendNUIMessage({
			label = Config.PetShop[i].label,
			pet = Config.PetShop[i].pet,
			price = Config.PetShop[i].price,
			display = true,
		})
		SetNuiFocus(true, true)
	end
end

function DoRequestModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
end

function DoRequestAnimSet(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Citizen.Wait(1)
	end
end
RegisterNetEvent("fivem_pets:OpenPetMenu") AddEventHandler("fivem_pets:OpenPetMenu", function() OpenPetMenu() end)