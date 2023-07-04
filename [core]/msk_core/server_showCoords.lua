if Config.showCoords.enable then
	MSK.RegisterCommand(Config.showCoords.command, Config.showCoords.groups, function(source, args, rawCommand)
		TriggerClientEvent('msk_core:showCoords', source)
	end, false --[[console]], false --[[framework]], {help = 'Show your own Coords'})
end