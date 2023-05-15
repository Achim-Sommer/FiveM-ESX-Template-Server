--------------------------------------------------
--                 _   _ _     _                --
--       Made by  | \ | | |   (_)               --
--       ___  __ _|  \| | |__  _  ___           --
--      / __|/ _` | . ` | '_ \| |/ _ \          --
--      \__ \ (_| | |\  | | | | |  __/          --
--      |___/\__,_\_| \_/_| |_| |\___|          --
--                           _/ |               --
--      discord.gg/fZhjAGX  |__/  2020          --
--                                              --
--------------------------------------------------
--   Made for xHoneynuttx Mosley's interior     --
--------------------------------------------------

liftUp = false
liftDown = false

spawned = false 

remoteModel = `prop_cs_remote_01`
inRemote = false

carliftProp = false
carlift2Prop = false

LoopIsRunning = false

---------------------------------------------------------------------------
-- Thread Key controls
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local letSleep = true
        local coords = GetEntityCoords(PlayerPedId())

        if GetDistanceBetweenCoords(coords, Config.LiftControlPanel2.x, Config.LiftControlPanel2.y, Config.LiftControlPanel2.z, true) < Config.DrawDistance then
            letSleep = false
            DrawText3Ds(Config.LiftControlPanel2.x, Config.LiftControlPanel2.y, Config.LiftControlPanel2.z, "~b~[E]~w~ Up ~g~[G]~w~ Down")
            if IsControlJustReleased(0, 38) then
                local carliftProp = GetClosestObjectOfType(-10.9, -1676.55, 29.84, 3.0, `lift`, 0, 0, 0)
                local elevatorCoords = GetEntityCoords(carliftProp, false)
                if carliftProp ~= nil then
                    TriggerServerEvent('sh_carlift:Lift1Up', true)
                    TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords)
                    Citizen.Wait(5000)
                end
            end
            if IsControlJustReleased(0, 47) then
                if IsSpawnPointClear(Config.Oilchange2, 1.0) then
                    local carliftProp = GetClosestObjectOfType(-10.9, -1676.55, 29.84, 3.0, `lift`, 0, 0, 0)
                    local elevatorCoords = GetEntityCoords(carliftProp, false)
                    if carliftProp ~= nil then
                        TriggerServerEvent('sh_carlift:Lift1Down', true)
                        TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords)
                        Citizen.Wait(5000)
                    end
                end
            end    
        end
        if GetDistanceBetweenCoords(coords, Config.LiftControlPanel.x, Config.LiftControlPanel.y, Config.LiftControlPanel.z, true) < Config.DrawDistance then
            letSleep = false
            DrawText3Ds(Config.LiftControlPanel.x, Config.LiftControlPanel.y, Config.LiftControlPanel.z, "~b~[E]~w~ Up ~g~[G]~w~ Down")
            if IsControlJustReleased(0, 38) then
                local carlift2Prop = GetClosestObjectOfType(-6.87, -1674.95, 29.84, 3.0, `lift`, 0, 0, 0)
                local elevatorCoords2 = GetEntityCoords(carlift2Prop, false)
                if carlift2Prop ~= nil then
                    TriggerServerEvent('sh_carlift:Lift2Up', true)
                    TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords2)
                    Citizen.Wait(5000)
                end
            end
            if IsControlJustReleased(0, 47) then
                if IsSpawnPointClear(Config.Oilchange, 1.0) then
                    local carlift2Prop = GetClosestObjectOfType(-6.87, -1674.95, 29.84, 3.0, `lift`, 0, 0, 0)
                    local elevatorCoords2 = GetEntityCoords(carlift2Prop, false)
                    if carlift2Prop ~= nil then
                        TriggerServerEvent('sh_carlift:Lift2Down', true)
                        TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords2)
                        Citizen.Wait(5000)
                    end
                end
            end   
        end
        if GetDistanceBetweenCoords(coords, Config.HiddenFountain.x, Config.HiddenFountain.y, Config.HiddenFountain.z, true) < Config.DrawDistance then
            letSleep = false
            if IsControlJustReleased(0, 38) then
                if not HasNamedPtfxAssetLoaded("core") then
                    RequestNamedPtfxAsset("core")
                end
                while not HasNamedPtfxAssetLoaded("core") do
                    Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("core")
                PlayWaterEffect("core", "water_cannon_jet", Config.HiddenFountain.x+0.32, Config.HiddenFountain.y+0.20, Config.HiddenFountain.z+0.10)
                SetPedToRagdollWithFall(PlayerPedId(), 1500, 7500, 1, vector3(-0.961, -0.2733812, 0), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end  
        end
        if letSleep then
            Citizen.Wait(1000)
        end 
    end
end)

---------------------------------------------------------------------------
-- Thread for prop movement
---------------------------------------------------------------------------
RegisterNetEvent('sh_carlift:RunLiftSync')
AddEventHandler('sh_carlift:RunLiftSync', function()
    if LoopIsRunning then
        return
    end

    LoopIsRunning = true

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local coords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(coords, Config.AreaToCheck, true) < 200 then
                local carliftProp = GetClosestObjectOfType(-10.9, -1676.55, 29.84, 3.0, `lift`, 0, 0, 0)
                local carlift2Prop = GetClosestObjectOfType(-6.87, -1674.95, 29.84, 3.0, `lift`, 0, 0, 0)
                local elevatorCoordsX, elevatorCoordsY, elevatorCoordsZ = table.unpack(GetEntityCoords(carliftProp, false))
                local elevatorCoords2X, elevatorCoords2Y, elevatorCoords2Z = table.unpack(GetEntityCoords(carlift2Prop, false))
                
                if liftUp and not liftDown and not liftUp2 and not liftDown2 then
                    if carliftProp ~= nil then
                        if elevatorCoordsZ < Config.max then 
                            elevatorCoordsZ = elevatorCoordsZ + Config.speed_up
                            SetEntityCoords(carliftProp, elevatorCoordsX, elevatorCoordsY, elevatorCoordsZ, false, false, false, false)
                            FreezeEntityPosition(carliftProp, true)
                        else
                            liftUp = false
                            LoopIsRunning = false
                            break
                        end
                    else
                        liftUp = false
                        LoopIsRunning = false
                        break
                    end
                end
                
                if liftDown and not liftUp and not liftUp2 and not liftDown2 then
                    if carliftProp ~= nil then
                        if elevatorCoordsZ > Config.min then 
                            elevatorCoordsZ = elevatorCoordsZ - Config.speed_down
                            SetEntityCoords(carliftProp, elevatorCoordsX, elevatorCoordsY, elevatorCoordsZ, false, false, false, false)
                            FreezeEntityPosition(carliftProp, true)
                        else
                            liftDown = false
                            LoopIsRunning = false
                            break
                        end
                    else
                        liftDown = false
                        LoopIsRunning = false
                        break
                    end
                end

                if liftUp2 and not liftUp and not liftDown and not liftDown2 then
                    if carlift2Prop ~= nil then
                        if elevatorCoords2Z < Config.max then 
                            elevatorCoords2Z = elevatorCoords2Z + Config.speed_up
                            SetEntityCoords(carlift2Prop, elevatorCoords2X, elevatorCoords2Y, elevatorCoords2Z, false, false, false, false)
                            FreezeEntityPosition(carlift2Prop, true)
                        else
                            liftUp2 = false
                            LoopIsRunning = false
                            break
                        end
                    else
                        liftUp2 = false
                        LoopIsRunning = false
                        break
                    end
                end
                
                if liftDown2 and not liftUp and not liftDown and not liftUp2 then
                    if carlift2Prop ~= nil then
                        if elevatorCoords2Z > Config.min then 
                            elevatorCoords2Z = elevatorCoords2Z - Config.speed_down
                            SetEntityCoords(carlift2Prop, elevatorCoords2X, elevatorCoords2Y, elevatorCoords2Z, false, false, false, false)
                            FreezeEntityPosition(carlift2Prop, true)
                        else
                            liftDown2 = false
                            LoopIsRunning = false
                            break
                        end
                    else
                        liftDown2 = false
                        LoopIsRunning = false
                        break
                    end
                end
            else
                liftUp          = false
                liftDown        = false
                liftUp2         = false
                liftDown2       = false
                LoopIsRunning   = false
                break
            end
        end
    end)
end)

---------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------
RegisterCommand("remote", function(source,args,raw)
    local coords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(coords, Config.AreaToCheck, true) < Config.RemoteDistance then
        loadAnimDict('cellphone@')
        TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_read_base', 2.0, 2.0, -1, 49, 0, false, false, false)
        SendNUIMessage({
            type     = "openRemote"
        })
        Citizen.Wait(100)
        SetNuiFocus(true, true)
        newRemoteProp()
    end
end, false)

RegisterCommand("oilchange", function(source,args,raw)
    local player = PlayerPedId()
    local playercoords = GetEntityCoords(player)
    if GetDistanceBetweenCoords(Config.Oilchange, playercoords, true) < 1.5 then
        TriggerServerEvent('sh_carlift:ParticleSync', Config.Oilchange.x, Config.Oilchange.y, Config.Oilchange.z)
    end
    if GetDistanceBetweenCoords(Config.Oilchange2, playercoords, true) < 1.5 then
        TriggerServerEvent('sh_carlift:ParticleSync', Config.Oilchange2.x, Config.Oilchange2.y, Config.Oilchange2.z)
    end
end, false)

---------------------------------------------------------------------------
-- NUI Callbacks
---------------------------------------------------------------------------
RegisterNUICallback('Close', function(data, cb)
    ClearPedSecondaryTask(PlayerPedId())
    ClearPedTasks(PlayerPedId())
    SetNuiFocus(false, false)
    deleteRemote()
    Citizen.Wait(100)
    if DoesEntityExist(remoteProp) then
        deleteRemote()
    end
    cb('ok')
end)

RegisterNUICallback('Up', function(data, cb)
    if liftUp or liftDown or liftUp2 or liftDown2 then
        return
    end
    local carliftProp = GetClosestObjectOfType(-10.9, -1676.55, 29.84, 3.0, `lift`, 0, 0, 0)
    local elevatorCoords = GetEntityCoords(carliftProp, false)
    if carliftProp ~= nil then
        TriggerServerEvent('sh_carlift:Lift1Up', true)
        TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords)
        Citizen.Wait(5000)
    end
    cb('ok')
end)

RegisterNUICallback('Down', function(data, cb)
    if liftUp or liftDown or liftUp2 or liftDown2 then
        return
    end
    local carliftProp = GetClosestObjectOfType(-10.9, -1676.55, 29.84, 3.0, `lift`, 0, 0, 0)
    local elevatorCoords = GetEntityCoords(carliftProp, false)
    if IsSpawnPointClear(Config.Oilchange2, 1.0) then
        if carliftProp ~= nil then
            TriggerServerEvent('sh_carlift:Lift1Down', true)
            TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords)
            Citizen.Wait(5000)
        end
    end
    cb('ok')
end)

RegisterNUICallback('Up2', function(data, cb)
    if liftUp or liftDown or liftUp2 or liftDown2 then
        return
    end
    local carlift2Prop = GetClosestObjectOfType(-6.87, -1674.95, 29.84, 3.0, `lift`, 0, 0, 0)
    local elevatorCoords2 = GetEntityCoords(carlift2Prop, false)
    if carlift2Prop ~= nil then
        TriggerServerEvent('sh_carlift:Lift2Up', true)
        TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords2)
        Citizen.Wait(5000)
    end
    cb('ok')
end)

RegisterNUICallback('Down2', function(data, cb)
    if liftUp or liftDown or liftUp2 or liftDown2 then
        return
    end
    local carlift2Prop = GetClosestObjectOfType(-6.87, -1674.95, 29.84, 3.0, `lift`, 0, 0, 0)
    local elevatorCoords2 = GetEntityCoords(carlift2Prop, false)
    if IsSpawnPointClear(Config.Oilchange, 1.0) then
        if carlift2Prop ~= nil then
            TriggerServerEvent('sh_carlift:Lift2Down', true)
            TriggerServerEvent('sh_carlift:PlayWithinDistanceSV', 15.0, "carlift", 0.5, elevatorCoords2)
            Citizen.Wait(5000)
        end
    end
    cb('ok')
end)

---------------------------------------------------------------------------
-- Net Events
---------------------------------------------------------------------------
RegisterNetEvent('sh_carlift:ClientLift1Up')
AddEventHandler('sh_carlift:ClientLift1Up', function(status)
    liftUp = status
    TriggerEvent('sh_carlift:RunLiftSync')
end)

RegisterNetEvent('sh_carlift:ClientLift1Down')
AddEventHandler('sh_carlift:ClientLift1Down', function(status)
    liftDown = status
    TriggerEvent('sh_carlift:RunLiftSync')
end)

RegisterNetEvent('sh_carlift:ClientLift2Up')
AddEventHandler('sh_carlift:ClientLift2Up', function(status)
    liftUp2 = status
    TriggerEvent('sh_carlift:RunLiftSync')
end)

RegisterNetEvent('sh_carlift:ClientLift2Down')
AddEventHandler('sh_carlift:ClientLift2Down', function(status)
    liftDown2 = status
    TriggerEvent('sh_carlift:RunLiftSync')
end)

RegisterNetEvent('sh_carlift:startParticleEffect')
AddEventHandler('sh_carlift:startParticleEffect', function(x, y, z)
    if not HasNamedPtfxAssetLoaded("core") then
        RequestNamedPtfxAsset("core")
    end
    while not HasNamedPtfxAssetLoaded("core") do
        Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("core")
    PlayEffect("core", "veh_oil_slick", x, y, z+1.5)
    PlayEffect("core", "ent_sht_petrol", x, y, z+1.5)
    PlayEffect("core", "liquid_splash_oil", x, y, z+1.5)
end)

RegisterNetEvent('sh_carlift:PlayWithinDistance')
AddEventHandler('sh_carlift:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume, coords)
    local playercoords = GetEntityCoords(PlayerPedId())
    local distIs  = Vdist(playercoords.x, playercoords.y, playercoords.z, coords.x, coords.y, coords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            type                = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

RegisterNetEvent('sh_carlift:StopWithinDistance')
AddEventHandler('sh_carlift:StopWithinDistance', function(playerNetId, soundFile)
    local lCoords = GetEntityCoords(PlayerPedId())
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= 10.0) then
        SendNUIMessage({
            type                = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.0
        })
    end
end)

---------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------
function PlayEffect(pdict, pname, x, y, z)
    Citizen.CreateThread(function()
        UseParticleFxAssetNextCall(pdict)
        local pfx = StartParticleFxLoopedAtCoord(pname, x, y, z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        Citizen.Wait(20000)
        StopParticleFxLooped(pfx, 0)
    end)
end

function PlayWaterEffect(pdict, pname, x, y, z)
    Citizen.CreateThread(function()
        UseParticleFxAssetNextCall(pdict)
        local pfx = StartParticleFxLoopedAtCoord(pname, x, y, z, 0.0, 0.0, 110.0, 1.0, false, false, false, false)
        Citizen.Wait(5000)
        StopParticleFxLooped(pfx, 0)
    end)
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(1)
    end
end

function newRemoteProp()
    deleteRemote()
    RequestModel(remoteModel)
    while not HasModelLoaded(remoteModel) do
        Citizen.Wait(1)
    end
    remoteProp = CreateObject(remoteModel, 1.0, 1.0, 1.0, 1, 1, 0)

    local bone = GetPedBoneIndex(PlayerPedId(), 28422)
    AttachEntityToEntity(remoteProp, PlayerPedId(), bone, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function deleteRemote()
    if remoteProp ~= 0 then
        Citizen.InvokeNative(0xAE3CBE5BF394C9C9 , Citizen.PointerValueIntInitialized(remoteProp))
        remoteProp = 0
    end
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end