Config = {}

-- Change 'false' to 'true' to toggle the engine automatically on when entering a vehicle
Config.OnAtEnter = false

-- Change 'false' to 'true' to use a key instead of the command
Config.UseKey = true
    Config.ToggleKey = 244 -- M (https://docs.fivem.net/docs/game-references/controls/)
Config.Commad = 'engine' -- If Config.UseKey = false then you can use the command instead

-- If both false then Default ESX Notification is active!
Config.Notifications = true -- https://forum.cfx.re/t/release-standalone-notification-script/1464244
Config.OkokNotify = false -- https://okok.tebex.io/package/4724993

-- Vehicle Key System - set true then only the Owner of the Vehicle or someone with a Key can start the Engine
Config.VehicleKeyChain = false -- https://kiminazes-script-gems.tebex.io/package/4524211