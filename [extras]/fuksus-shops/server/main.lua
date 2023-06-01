lib.callback.register('fuksus-shops:getConfig', function(source)
    return Config
end)

lib.callback.register('fuksus-shops:buyItems', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    for i=1, #data.items do
        local item = data.items[i]
        if not xPlayer.canCarryItem(item.name, item.amount) then
            xPlayer.showNotification(Locales[Config.locale]['game'].notEnoughSpace)
            return true
        end
    end

    local spend = 0
    local money = xPlayer.getAccount(data.payment).money

    for i=1, #data.items do
        local item = data.items[i]
        spend += item.price * item.amount
        if spend > money then
            xPlayer.showNotification(Locales[Config.locale]['game'].notEnoughMoney)
            return true
        end
    end

    xPlayer.removeAccountMoney(data.payment, spend)

    for i=1, #data.items do
        local item = data.items[i]
        if xPlayer.canCarryItem(item.name, item.amount) then
            xPlayer.addInventoryItem(item.name, item.amount)
        end
    end

    return true
end)

CreateThread(function()
    local itemNames = {}
    for item, data in pairs(exports.ox_inventory:Items()) do
        itemNames[item] = data.label
    end
    for k,v in pairs(Config.shops) do
        for i=1, #v.items do
            local item = v.items[i]
            item.label = itemNames[item.name]
        end
    end
    print('[^2fuksus-shops^7] Loaded item names.')
end)
