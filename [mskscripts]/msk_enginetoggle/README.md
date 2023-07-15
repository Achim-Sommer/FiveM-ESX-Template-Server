# EngineToggle
FiveM Script - Vehicle Engine Toggle On/Off

![GitHub release (latest by date)](https://img.shields.io/github/v/release/Musiker15/msk_enginetoggle?color=gree&label=Update)

**Forum:** https://forum.cfx.re/t/re-release-enginetoggle/4793840

**Discord Support:** https://discord.gg/5hHSBRHvJE

## Description
* The engine keeps running if you leave the vehicle without turning the engine off.
* You can set that the engine starts automatically when entering a vehicle.
* You can choose if you use a Hotkey or a Command.
* You can choose between 3 diffrent Notifications.
* If you set `Config.VehicleKeyChain` to true then only the Owner of the Vehicle or someone with a Key can start the Engine!
* Hotwire Function in compatibility with VKC

## Requirements
* Standalone
* ESX Framework **only** for `Hotwire Function`
### Optional
* VehicleKeyChain (https://forum.cfx.re/t/release-vehicle-key-chain/3319563)
* ProgessBar (https://forum.cfx.re/t/release-pogress-bar-progress-bar-standalone-smooth-animation/838951)

### VehicleKeyChain
If you want to add a permanent key:
```lua
-- clientside --
local plate = GetVehicleNumberPlateText(vehicle)
TriggerServerEvent('VKC:setKey', true, plate, 1) -- Give a Key to the Player
TriggerServerEvent('VKC:setKey', false, plate, 1) -- Remove the Key from the Player

-- or this one

-- clientside --
-- Give a Key to the Player
local plate = 'ABC 123'
SetVehicleNumberPlateText(vehicle, plate) -- Only if you don't use AdvancedParking
exports["AdvancedParking"]:UpdatePlate(vehicle, plate) -- Only if you use AdvancedParking
TriggerServerEvent('VKC:setKey', true, plate, 1)
-- Remove the Key from the Player
TriggerServerEvent('VKC:setKey', false, plate, 1)

-- serverside --
RegisterServerEvent('VKC:setKey')
AddEventHandler('VKC:setKey', function(set, plate, count)
    if set then -- Add Key
        exports["VehicleKeyChain"]:AddKey(source, plate, count)
    else -- Remove Key
        exports["VehicleKeyChain"]:RemoveKey(source, plate, count)
    end
end)
```
If you only want a temporary key that will be deleted after restart use this:
```lua
-- clientside --
TriggerServerEvent("VKC:giveTempKey", true, "PLATE") -- Add Temp Key
TriggerServerEvent("VKC:giveTempKey", false, "PLATE") -- Remove Temp Key

-- serverside --
RegisterNetEvent("VKC:giveTempKey")
AddEventHandler("VKC:giveTempKey", function(set, plate)
    if set then -- Add Temp Key
        exports["VehicleKeyChain"]:AddTempKey(source, plate)
    else -- Remove Temp Key
        exports["VehicleKeyChain"]:RemoveTempKey(source, plate)
    end
end)
```
### RealisticVehicleDamage
If you use `RealisticVehicleDamage`, then replace following Code in `client.lua` on Line 333 in RealisticVehicleDamage:
```lua
if healthEngineCurrent > cfg.engineSafeGuard+1 then
    SetVehicleUndriveable(vehicle,false)
    TriggerEvent('msk_enginetoggle:RPDamage', true)
end

if healthEngineCurrent <= cfg.engineSafeGuard+1 and cfg.limpMode == false then
    SetVehicleUndriveable(vehicle,true)
    TriggerEvent('msk_enginetoggle:RPDamage', false)
end
```
### QB-Vehiclefailure
IF you use `qb-vehiclefailure`, then replace the following Code in `client.lua` on Line 530 in qb-vehiclefailure:
```lua
if healthEngineCurrent > cfg.engineSafeGuard+1 then
    SetVehicleUndriveable(vehicle, false)
    TriggerEvent('msk_enginetoggle:RPDamage', true)
end

if healthEngineCurrent <= cfg.engineSafeGuard+1 and cfg.limpMode == false then
    local vehpos = GetEntityCoords(vehicle)
    StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", vehpos.x, vehpos.y, vehpos.z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    SetVehicleUndriveable(vehicle, true)
    TriggerEvent('msk_enginetoggle:RPDamage', false)
end
```

## My other Scripts
#### PAID
* [[ESX] Armor Script - Multiple Armor Vests](https://forum.cfx.re/t/release-esx-armor-script-usable-armor-vests-status-will-be-saved-in-database-and-restore-after-relog/4812243)
* [[ESX] Banking - NativeUI](https://forum.cfx.re/t/esx-msk-banking-nativeui/4859560)
* [[ESX] Handcuffs - Realistic Handcuffs](https://forum.cfx.re/t/esx-msk-handcuffs-realistic-handcuffs/4885324)
* [[ESX] Shopsystem - NativeUI & Database Feature](https://forum.cfx.re/t/release-esx-msk-shopsystem-nativeui-database-feature/4853593)
* [[ESX/QBCore] Simcard - Change your phonenumber](https://forum.cfx.re/t/release-esx-qbcore-usable-simcard/4847008)
* [[ESX] Weapon Ammunition with Clips, Components & Tints](https://forum.cfx.re/t/release-esx-weapon-ammunition-with-clips-components-tints/4793783)
#### FREE
* [[ESX] MSK Deathcounter - integrated in myMultichar](https://forum.cfx.re/t/release-esx-msk-deathcounter-integrated-in-mymultichar/4863428)

## License
**GNU General Public License v3.0**
