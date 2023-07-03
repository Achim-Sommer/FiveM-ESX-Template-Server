ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('fivem_pets:getPet', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT pet FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1].pet ~= nil then
			cb(result[1].pet)
		else
			cb('')
		end
	end)
end)

RegisterServerEvent('fivem_pets:petDied')
AddEventHandler('fivem_pets:petDied', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('UPDATE users SET pet = "(NULL)" WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('fivem_pets:consumePetFood')
AddEventHandler('fivem_pets:consumePetFood', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('petfood', 1)
end)

ESX.RegisterServerCallback('fivem_pets:buyPet', function(source, cb, pet, label, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	if price == 0 then
		print('fivem_pets: %s attempted to buy an invalid pet!')
		cb(false)
	end

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		MySQL.Async.execute('UPDATE users SET pet = @pet WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
			['@pet'] = pet
		}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_bought', label, ESX.Math.GroupDigits(price)))
			cb(true)
		end)
	else
		TriggerClientEvent('esx:showNotification', source, _U('your_poor'))
		cb(false)
	end
end)
