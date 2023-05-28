local ox_inventory = exports.ox_inventory

RegisterNetEvent("hyon_stealfuel:checkitem", function(id)
   local xPlayer = ESX.GetPlayerFromId(source)
   local item = Config.hose
   local haveitem = false
   print(xPlayer.getInventoryItem(item).count)
    if xPlayer.getInventoryItem(item).count >= 1 then
		haveitem = true
		TriggerClientEvent("hyon_stealfuel:haveitem", xPlayer.source, haveitem)
	else
		TriggerClientEvent("hyon_stealfuel:haveitem", xPlayer.source, haveitem)
    end
end)

RegisterNetEvent('hyon_stealfuel:steal', function(netid, fuel)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = ox_inventory:GetCurrentWeapon(source)

	if item and fuel > 0 then
		if item.metadata.durability < 100 and item.metadata.ammo < 100 then
			durability = item.metadata.durability + 10
			item.metadata.durability = durability
			item.metadata.ammo = durability
			ox_inventory:SetMetadata(source, item.slot, item.metadata)
			local test = true
			TriggerClientEvent("hyon_stealfuel:fuel", xPlayer.source, test)
			xPlayer.showNotification(Config.Locales.fuelstealed)
			Wait(0)
		else
				xPlayer.showNotification(Config.Locales.canfuel)	
		end
	else
				xPlayer.showNotification(Config.Locales.lowfull)
	end

end)

RegisterNetEvent("hyon_stealfuel:removehose", function(id)
   local xPlayer = ESX.GetPlayerFromId(source)
   local item = Config.hose
		        xPlayer.removeInventoryItem(item, 1)
				xPlayer.showNotification(Config.Locales.brokhose)
end)