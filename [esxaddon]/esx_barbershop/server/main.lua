RegisterNetEvent('esx_barbershop:pay', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
		
	if not xPlayer and src then return print(('^3[WARNING]^0 xPlayer for Id %s, couldn`t be found.'):format(src)) end

	xPlayer.removeMoney(Config.Price, "Haircut")
	TriggerClientEvent('esx:showNotification', src, TranslateCap('you_paid', ESX.Math.GroupDigits(Config.Price)))
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
		
	if not xPlayer and source then return print(('^3[WARNING]^0 xPlayer for Id %s, couldn`t be found.'):format(source)) end
		
	cb(xPlayer.getMoney() >= Config.Price)
end)
