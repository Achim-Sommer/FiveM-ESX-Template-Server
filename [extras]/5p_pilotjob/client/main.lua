local opened = false
local blip = nil
local mainBlip = nil
local planeVeh = nil
local activity = nil
local destination = nil

if Config.UseOldESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterNetEvent('5p_pilot:client:openUI')
AddEventHandler('5p_pilot:client:openUI', function()
    
    if not opened then
        SendNUIMessage({
            action = 'open'
        })
    else
        SendNUIMessage({
            action = 'close'
        })
    end

    opened = not opened
    SetNuiFocus(opened, opened)
end)

RegisterNUICallback('close', function()
    opened = false
    SendNUIMessage({
        action = 'close'
    })
    SetNuiFocus(opened, opened)
end)

CreateThread(function()
    InitBlip()
    Wait(500)
    while true do
        local msec = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
            
        if Config.UseJob then
            if #(Config.StartJob - playerCoords) < 5.0 and ESX.GetPlayerData().job.name == Config.JobName then
                msec = 0
                if not opened then
                    DrawText('~y~Pilot\n~b~Drücke ~y~E ~b~um als Pilot zu arbeiten', Config.StartJob, 0, 0.7)
                    if IsControlJustPressed(0, Config.DefaultKey) and #(Config.StartJob - playerCoords) < 1.5 then
                        TriggerEvent('5p_pilot:client:openUI')
                    end
                end
            end
        else
            if #(Config.StartJob - playerCoords) < 5.0 then
                msec = 0
                if not opened then
                    DrawText('~y~Pilot\n~b~Drücke ~y~E ~b~um als Pilot zu arbeiten', Config.StartJob, 0, 0.7)
                    if IsControlJustPressed(0, Config.DefaultKey) and #(Config.StartJob - playerCoords) < 1.5 then
                        TriggerEvent('5p_pilot:client:openUI')
                    end
                end
            end
        end

        Wait(msec)
    end
end)

RegisterNUICallback('start', function(data, cb)
    local isClear = ESX.Game.IsSpawnPointClear(Config.SpawnLocation.xyz, 3.0)
    destination = Config.Destination[math.random(1, #Config.Destination)]

    if isClear then
        activity = data.type
        local plane = Config.PlaneModel[data.type]

        ESX.Game.SpawnVehicle(plane, Config.SpawnLocation.xyz, Config.SpawnLocation.w, function(vehicle)
            if vehicle then
                if DoesEntityExist(vehicle) then
                    planeVeh = vehicle
                    SetVehicleNumberPlateText(vehicle, Config.PlateLabel)
                    SetVehicleOnGroundProperly(vehicle)
                    CreateBlip(Config.SpawnLocation)
                    TriggerEvent('chat:addMessage', {color = { 230, 219, 45 }, args = {'Betrete das Flugzeug, das sich hinter dir befindet.'}})

                    while #(GetEntityCoords(PlayerPedId()) - Config.SpawnLocation.xyz) > 20.0 do Wait(1000) end
                    RemoveBlip(blip)
                    blip = nil

                    while not IsPedInAnyPlane(PlayerPedId()) do Wait(1000) end
                    TriggerEvent('chat:addMessage', {color = { 230, 219, 45 }, args = {'Du hast einen neuen Standort auf deiner Karte, fliege zum neuen Flughafen.'}})
                    CreateBlip(destination)
                    TriggerEvent('5p_pilot:client:flying', k)
                end
            end
        end)
    else
        ESX.ShowNotification('Pilot', 'Der Spawn-Punkt ist unklar', 'error')
    end
end)

RegisterNetEvent('5p_pilot:client:flying')
AddEventHandler('5p_pilot:client:flying', function(k)
    while true do
        local msec = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local currentPlane = GetVehiclePedIsIn(playerPed)

        if #(destination - playerCoords) < 50.0 then
            msec = 0
            DrawMarker(1, destination + vec3(0.0, 0.0, -1.0), 0, 0, 0, 0, 0, 0, 5.0, 5.0, 1.0, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0)
            if #(destination - playerCoords) < 8.0 then
                ESX.ShowHelpNotification('Drücke ~INPUT_CONTEXT~ um das Flugzeug zu landen')
                if IsControlJustPressed(0, Config.DefaultKey) and IsPedInAnyPlane(PlayerPedId()) then
                    if planeVeh == currentPlane then
                        TriggerEvent('5p_pilot:client:land', k)
                        RemoveBlip(blip)
                        break
                    else
                        ESX.ShowNotification('Pilot', 'Du bist nicht in dem Flugzeug, das du benutzen musst', 'error')
                    end
                end
            end
        end

        Wait(msec)
    end
end)

RegisterNetEvent('5p_pilot:client:land')
AddEventHandler('5p_pilot:client:land', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local plane = GetVehiclePedIsIn(playerPed)
    local planeCoords = GetEntityCoords(plane)

    local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(planeCoords.x, planeCoords.y, planeCoords.z + vec3(0.0, 0.0, 1.0)), 0, 0, 0, 50.0)
    SetCamRot(cam, GetEntityRotation(plane), 2)
    SetCamActive(cam, true)
    DisableAllControlActions(0)
    PointCamAtCoord(cam, vector3(planeCoords.x, planeCoords.y, planeCoords.z))
    RenderScriptCams(true, false, 1, true, false)

    TriggerEvent('chat:addMessage', {color = { 230, 219, 45 }, args = {'Du hast dein Flugzeug gelandet, warte, bis dein Flugzeug leer ist.'}})
    FreezeEntityPosition(plane, true)

    Progressbar(5000)

    Wait(5000)

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam, false)
    FreezeEntityPosition(plane, false)
    TriggerEvent('chat:addMessage', {color = { 230, 219, 45 }, args = {'Dein Flugzeug ist nun leer, kehre zum Flughafen zurück.'}})
    TriggerEvent('5p_pilot:client:return', k)
    CreateBlip(Config.SpawnLocation)
end)

RegisterNetEvent('5p_pilot:client:return')
AddEventHandler('5p_pilot:client:return', function(k)
    while true do
        local msec = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local plane = GetVehiclePedIsIn(playerPed)

        if #(Config.SpawnLocation.xyz - playerCoords) < 50.0 then
            msec = 0
            DrawMarker(1, Config.SpawnLocation.xyz + vec3(0.0, 0.0, -1.0), 0, 0, 0, 0, 0, 0, 5.0, 5.0, 1.0, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0)
            if #(Config.SpawnLocation.xyz - playerCoords) < 8.0 then
                ESX.ShowHelpNotification('Drücke ~INPUT_CONTEXT~ um das Flugzeug zurückzugeben')
                if IsControlJustPressed(0, Config.DefaultKey) and IsPedInAnyPlane(PlayerPedId()) then
                    if planeVeh == plane then
                        TriggerEvent('chat:addMessage', {color = { 230, 219, 45 }, args = {'Du hast das Flugzeug zurückgebracht, herzlichen Glückwunsch für die erledigte Arbeit!'}})
                        TaskLeaveVehicle(playerPed, plane, 0)
                        Wait(5000)
                        DeleteEntity(plane)

                        local money = Config.Money[activity]
                        TriggerServerEvent('5p_pilot:server:pay', activity, money)
                        TriggerEvent('chat:addMessage', {color = { 255, 255, 255 }, args = {'Du bekommst ^2$' .. ESX.Math.Round(money) .. ' ^0für diesen Job.'}})
                        RemoveBlip(blip)
                        activity = nil
                        planeVeh = nil
                        blip = nil
                        break
                    else
                        ESX.ShowNotification('Pilot', 'Du hast nicht das richtige FLugzeug', 'error')
                    end
                end
            end
        end

        Wait(msec)
    end
end)

function CreateBlip(coords)
    blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipScale(blip, Config.JobBlips.scale)
    SetBlipSprite(blip, Config.JobBlips.sprite)
    SetBlipColour(blip, Config.JobBlips.color)

    SetBlipRoute(blip, true)
end

function Progressbar(time)
    SendNUIMessage({
        action = 'progress',
        time = time or 5000
    })
end

function DrawText(text, coords, font, size)

    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)

    if not font then font = 0 end
    if not size then size = 0.7 end

    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)

    SetDrawOrigin(coords, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function InitBlip()
    if mainBlip then
       RemoveBlip(mainBlip) 
    end
 
    mainBlip = AddBlipForCoord(Config.StartJob)
    SetBlipSprite(mainBlip, Config.MainBlip.sprite)
    SetBlipScale(mainBlip, Config.MainBlip.scale)
    SetBlipColour(mainBlip, Config.MainBlip.color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.MainBlip.label)
    EndTextCommandSetBlipName(mainBlip)
end
