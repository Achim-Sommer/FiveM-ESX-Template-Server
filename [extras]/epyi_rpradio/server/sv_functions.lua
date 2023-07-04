-- # // HASITEM CALLBACK \\ # --
ESX.RegisterServerCallback("epyi_rpradio:hasItem", function(source, cb, itemName, itemCount)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.hasItem(itemName)
    if item.count >= itemCount then
        cb(true)
    else
        cb(false)
    end
end)