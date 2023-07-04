-- # // CREDITS \\ # --
Citizen.CreateThread(function()
    print("^5epyi_rpradio ^4OpenSource RageUI RP-Radio script that use pma-voice^0")
end)

-- # // RADOP AS ITEM \\ # --
if canStartResource then
	ESX.RegisterUsableItem('radio', function(source)
		TriggerClientEvent("epyi_rpradio:openMenu", source)
	end)
else
	print("^5 epyi_rpradio ^4The resource could not be started correctly. Make sure the resource name is epyi_rpradio.")
end