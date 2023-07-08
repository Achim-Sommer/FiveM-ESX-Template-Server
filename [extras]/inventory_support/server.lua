-- CREDIT to https://github.com/GeerdoDaGr8 for the cigarettes function provided in the overextended discord

RegisterNetEvent('invsup:server:item:smoke_cig')
AddEventHandler('invsup:server:item:smoke_cig', function(info)
    local _source = source
    if info.metadata.total == nil then
        info.metadata.total = 1
    end
    if info.metadata.weight ~= nil then
        local weight = info.metadata.weight - 1
        info.metadata.weight = weight
    end
    info.metadata.total = (info.metadata.total - 1)
    info.metadata.description = 'Pack of ' .. info.metadata.total .. ' Cigarettes'
    if info.metadata.total > 0 then
        Inventory:SetMetadata(_source, info.slot, info.metadata)
        TriggerClientEvent('ox_inventory:notify', _source, {text = 'Your pack has ' .. info.metadata.total .. ' cigarettes left'})
    else
        Inventory:RemoveItem(_source, info.name, 1, nil, info.slot)
        TriggerClientEvent('ox_inventory:notify', _source, {text = 'Your pack is empty now'})
    end
end)

RegisterNetEvent('invsup:server:item:remove_cig')
AddEventHandler('invsup:server:item:remove_cig', function(slot)
    local _source = source
    local info = Inventory:GetSlot(_source, slot)
    if info.metadata.weight ~= nil then
        local weight = info.metadata.weight - 1
        info.metadata.weight = weight
    end
    if info.metadata.total == nil then
        info.metadata.total = 1
    end
    info.metadata.total = (info.metadata.total - 1)
    info.metadata.description = 'Pack of ' .. info.metadata.total .. ' Cigarettes'
    if info.metadata.total > 0 then
        Inventory:SetMetadata(_source, info.slot, info.metadata)
        Inventory:AddItem(_source, 'cigarette', 1, nil, nil)
        TriggerClientEvent('ox_inventory:notify', _source, {text = 'Your pack has ' .. info.metadata.total .. ' cigarettes left'})
    else
        Inventory:RemoveItem(_source, info.name, 1, nil, info.slot)
        Inventory:AddItem(_source, 'cigarette', 1, nil, nil)
        TriggerClientEvent('ox_inventory:notify', _source, {text = 'Your pack is empty now'})
    end
end)