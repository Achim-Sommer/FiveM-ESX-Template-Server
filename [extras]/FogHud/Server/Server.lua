
ESX = exports['es_extended']:getSharedObject()


ESX.RegisterServerCallback("Roda_FogHud:FirstCallBack", function(src, cb)
    while not ESX.GetPlayerFromId(src) do 
        Wait(20)
    end

    local xPlayer = ESX.GetPlayerFromId(src)
    cb(xPlayer,xPlayer.getMoney(), xPlayer.getAccount('black_money').money, GetBankMoney(xPlayer) or xPlayer.getBank()) --- Maybe compatibility with 1.1
end)

function GetBankMoney(xPlayer)
    return xPlayer.getAccount('bank').money
end