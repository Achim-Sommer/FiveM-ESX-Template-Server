ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem(Config.Item, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(source)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        TriggerClientEvent('ws_headlights:itemUse', source)
    else
        TriggerClientEvent('ws_headlights:not_in_vehicle_notify', source)
    end
end)

RegisterServerEvent('ws_headlights:removeItem')
AddEventHandler('ws_headlights:removeItem', function(src)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem(Config.Item, 1)
end)