Config = {}
----------------------------------------------------------------
Config.VersionChecker = true
Config.Debug = true
----------------------------------------------------------------
-- !!! This function is clientside AND serverside !!!
Config.Notification = function(source, message)
    if IsDuplicityVersion() then -- serverside
        MSK.Notification(source, 'MSK JobGPS', message)
    else -- clientside
        MSK.Notification('MSK JobGPS', message)
    end
end
----------------------------------------------------------------
Config.GPS = {
    item = 'gps',
    blip = {id = 1, color = 5, scale = 0.8},
    refresh = 2.5 -- in seconds // Refreshtime if player is not in OneSync distance
}

Config.Panicbutton = {
    item = {enable = false, item = 'panicbutton'}, -- You need that item in your inventory if set to true
    hotkey = {enable = true, key = 'f9'}, -- Command has to be activated // RegisterKeyMapping (https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)
    blipColor = 1, -- This will change the Blipcolor of GPS Blip

    notifyNearestPlayers = true,
}
----------------------------------------------------------------
Config.Commands = {
    gps = {enable = true, command = 'toggleGPS'},
    panicbutton = {enable = true, command = 'togglePanic'}
}
----------------------------------------------------------------
Config.allowedJobs = {
    ['police'] = {gps = true, panicbutton = true},
    ['ambulance'] = {gps = true, panicbutton = true},
    ['justice'] = {gps = true, panicbutton = true},

    ['bloods'] = {gps = true, panicbutton = false},
    ['grove'] = {gps = true, panicbutton = false},
    ['vagos'] = {gps = true, panicbutton = false},
    ['crips'] = {gps = true, panicbutton = false},
    ['ballas'] = {gps = true, panicbutton = false},
}