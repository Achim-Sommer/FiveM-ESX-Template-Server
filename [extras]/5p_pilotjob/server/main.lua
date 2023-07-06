if Config.UseOldESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterServerEvent('5p_pilot:server:pay')
AddEventHandler('5p_pilot:server:pay', function(flight, money)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addMoney(money)
end)