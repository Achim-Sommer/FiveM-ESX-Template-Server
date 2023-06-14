ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("esx_slots:BetsAndMoney")
AddEventHandler("esx_slots:BetsAndMoney", function(bets)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local xItem = xPlayer.getInventoryItem('zetony')
        if xItem.count < 10 then
            TriggerClientEvent('esx:showNotification', _source, "You need at least 10 chips to play!")
        else
            MySQL.Sync.execute("UPDATE users SET zetony=@zetony WHERE identifier=@identifier",{['@identifier'] = xPlayer.identifier, ['@zetony'] = xItem.count})
            TriggerClientEvent("esx_slots:UpdateSlots", _source, xItem.count)
            xPlayer.removeInventoryItem('zetony', xItem.count)
        end
    end
end)

RegisterServerEvent("esx_slots:updateCoins")
AddEventHandler("esx_slots:updateCoins", function(bets)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    if xPlayer then
        MySQL.Sync.execute("UPDATE users SET zetony=@zetony WHERE identifier=@identifier",{['@identifier'] = xPlayer.identifier, ['@zetony'] = bets})
    end
end)

RegisterServerEvent("esx_slots:PayOutRewards")
AddEventHandler("esx_slots:PayOutRewards", function(amount)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    if xPlayer then
        amount = math.floor(tonumber(amount))
        if amount > 0 then
            xPlayer.addInventoryItem('zetony', amount)
        end
        MySQL.Sync.execute("UPDATE users SET zetony=0 WHERE identifier=@identifier",{['@identifier'] = xPlayer.identifier})
    end
end)

RegisterServerEvent("route68_kasyno:WymienZetony")
AddEventHandler("route68_kasyno:WymienZetony", function(count)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local xItem = xPlayer.getInventoryItem('zetony')
        if xItem.count < count then
            TriggerClientEvent('pNotify:SendNotification', _source, {text = 'Du hast nicht genung Spielchips!'})
        elseif xItem.count >= count then
            local kwota = math.floor(count * 5)
            xPlayer.removeInventoryItem('zetony', count)
            xPlayer.addMoney(kwota)
            TriggerClientEvent('pNotify:SendNotification', _source, {text = 'Du bekommst $'..kwota..' für '..count..' Spielchips.'})
        end
    end
end)

RegisterServerEvent("route68_kasyno:KupZetony")
AddEventHandler("route68_kasyno:KupZetony", function(count)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local cash = xPlayer.getMoney()
        local kwota = math.floor(count * 5)
        if kwota > cash then
            TriggerClientEvent('pNotify:SendNotification', _source, {text = 'Du hast nicht genug Geld!'})
        elseif kwota <= cash then
            xPlayer.addInventoryItem('zetony', count)
            xPlayer.removeMoney(kwota)
            TriggerClientEvent('pNotify:SendNotification', _source, {text = 'Du bekommst '..count..' Spielchips für $'..kwota..'.'})
        end
    end
end)

RegisterServerEvent("route68_kasyno:KupAlkohol")
AddEventHandler("route68_kasyno:KupAlkohol", function(count, item)
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local cash = xPlayer.getMoney()
        local kwota = math.floor(count * 10)
        if kwota > cash then
            TriggerClientEvent('pNotify:SendNotification', _source, {text = 'Du hast nicht genug Geld!'})
        elseif kwota <= cash then
            xPlayer.addInventoryItem(item, count)
            xPlayer.removeMoney(kwota)
            TriggerClientEvent('pNotify:SendNotification', _source, {text = 'You got '..count..' items for $'..count..'.'})
        end
    end
end)

RegisterServerEvent("route68_kasyno:getJoinChips")
AddEventHandler("route68_kasyno:getJoinChips", function()
    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    MySQL.Async.fetchAll('SELECT zetony FROM users WHERE @identifier=identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
            local zetony = result[1].zetony
            if zetony > 0 then
                TriggerClientEvent('pNotify:SendNotification', _source, {text = 'Du bekommst '..tostring(zetony)..' Spielchips weil du deinen Platz verlassen hast.'})
                xPlayer.addInventoryItem('zetony', zetony)
                MySQL.Sync.execute("UPDATE users SET zetony=0 WHERE identifier=@identifier",{['@identifier'] = xPlayer.identifier})
            end
		end
	end)
end)