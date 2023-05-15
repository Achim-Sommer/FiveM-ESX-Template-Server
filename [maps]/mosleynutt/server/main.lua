--------------------------------------------------
--                 _   _ _     _                --
--       Made by  | \ | | |   (_)               --
--       ___  __ _|  \| | |__  _  ___           --
--      / __|/ _` | . ` | '_ \| |/ _ \          --
--      \__ \ (_| | |\  | | | | |  __/          --
--      |___/\__,_\_| \_/_| |_| |\___|          --
--                           _/ |               --
--      discord.gg/fZhjAGX  |__/  2020          --
--                                              --
--------------------------------------------------
--   Made for xHoneynuttx Mosley's interior     --
--------------------------------------------------

-------------------------------------------------------------
-- Spawn sync on clients
-------------------------------------------------------------
RegisterServerEvent('sh_carlift:Lift1Up')
AddEventHandler('sh_carlift:Lift1Up', function(status)
    TriggerClientEvent('sh_carlift:ClientLift1Up', -1, status)
end)

RegisterServerEvent('sh_carlift:Lift1Down')
AddEventHandler('sh_carlift:Lift1Down', function(status)
    TriggerClientEvent('sh_carlift:ClientLift1Down', -1, status)
end)

RegisterServerEvent('sh_carlift:Lift2Up')
AddEventHandler('sh_carlift:Lift2Up', function(status)
    TriggerClientEvent('sh_carlift:ClientLift2Up', -1, status)
end)

RegisterServerEvent('sh_carlift:Lift2Down')
AddEventHandler('sh_carlift:Lift2Down', function(status)
    TriggerClientEvent('sh_carlift:ClientLift2Down', -1, status)
end)

-------------------------------------------------------------
-- Sounds
-------------------------------------------------------------
RegisterServerEvent('sh_carlift:PlayWithinDistanceSV')
AddEventHandler('sh_carlift:PlayWithinDistanceSV', function(maxDistance, soundFile, soundVolume, coords)
    TriggerClientEvent('sh_carlift:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume, coords)
end)

RegisterServerEvent('sh_carlift:StopWithinDistanceSV')
AddEventHandler('sh_carlift:StopWithinDistanceSV', function(soundFile)
    TriggerClientEvent('sh_carlift:StopWithinDistance', -1, source, soundFile)
end)

-------------------------------------------------------------
-- ParticleFx Sync
-------------------------------------------------------------
RegisterServerEvent('sh_carlift:ParticleSync')
AddEventHandler('sh_carlift:ParticleSync', function(x, y, z)
    TriggerClientEvent('sh_carlift:startParticleEffect', -1, x, y, z)
end)