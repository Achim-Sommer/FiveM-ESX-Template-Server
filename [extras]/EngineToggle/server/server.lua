if not Config.UseKey then
	RegisterCommand(Config.Commad, function(Source, Arguments, RawCommand)
		if #Arguments == 0 then
			TriggerClientEvent('EngineToggle:Engine', Source)
		end
	end, false)
end