Config = {}
----------------------------------------------------------------
Config.Locale = 'de'
Config.VersionChecker = true
----------------------------------------------------------------
-- If Standalone then you cant't use the Hotwire Feature and you have to replace the Notification
Config.Framework = 'ESX' -- 'ESX' or 'Standalone'
----------------------------------------------------------------
-- !!! This function is clientside AND serverside !!!
Config.Notification = function(source, message)
    if IsDuplicityVersion() then -- serverside
        MSK.Notification(source, 'MSK EngineToggle', message)
    else -- clientside
        MSK.Notification('MSK EngineToggle', message)
    end
end
----------------------------------------------------------------
Config.Hotkey = {
    enable = true, -- Set false if you don't want to use a Hotkey
    key = 244 -- default: 244 = M
}

Config.Command = {
    enable = false, -- Set true if you want to use a Command
    command = 'engine'
}

Config.AdminCommand = { -- ESX Framework required !!
    enable = true,
    command = 'adengine',
    groups = {'superadmin', 'admin'}
}

Config.OnAtEnter = false -- Change 'false' to 'true' to toggle the engine automatically on when entering a vehicle
----------------------------------------------------------------
-- Vehicle Key System - set true then only the Owner of the Vehicle or someone with a Key can start the Engine
Config.VehicleKeyChain = false -- https://kiminazes-script-gems.tebex.io/package/4524211
----------------------------------------------------------------
Config.SaveSteeringAngle = true
Config.SaveAngleOnExit = 75 -- default: F - 75 (Exit Vehicle)
Config.PerformanceVersion = false -- true = no sync but more performance
Config.RefreshTime = 5 -- in seconds // Refreshing SteeringAngle all 5 seconds
----------------------------------------------------------------
-- With this feature you can set vehicles and plates for which you don't need a key to start the engine
-- either exact plates or just a string that should be in the vehicles plate e.g. "ESX" will ignore te plate "ESX1234" too
Config.Whitelist = {
    vehicles = {
        -- "nero2",
        -- "zentorno",
    },
    plates = {
        -- "ESX",
        -- "MSK",
    },
}
----------------------------------------------------------------
-- Only possible with ESX Framework
Config.enableLockpick = false -- Set false if you want to deactivate this feature

Config.progressBar = function(time, message)
    exports['pogressBar']:drawBar(time, message)
end

Config.RemoveLockpickItem = true -- Set true if you like to remove item after failing lockpicking
Config.LockpickItem = 'lockpick' -- Set the itemname what you want to use
Config.startEngine = true -- Set true if you want to start the engine after successfull lockpicking
Config.Probability = {
    lockpick = 66, -- default: 66%
    alarm = 33, -- default: 33%
    enableSearchKey = true, -- Set false if you dont want this
    searchKey = 66 -- default: 66%
}
Config.LockpickKey = {
    enable = false, -- Set to true if you want to use a Hotkey
    key = 38 -- default: E // Set the Hotkey
}
Config.ProgessBar = {
    enable = true, -- Set true if you want to show a progressbar
    time = 8 -- In seconds // Time how long does it takes
}
Config.Animation = {
    InsideOutsideAnimation = true, -- Set to false if you want same Animation for inside and outside
    generalAnimation = 'WORLD_HUMAN_WELDING',
    
    insideVehicle = { -- Animation inside Vehicle
        dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer'
    },
    outsideVehicle = { -- Animation outside Vehicle
        dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer'
    }
}
