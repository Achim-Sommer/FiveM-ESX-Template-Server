Config = {}
----------------------------------------------------------------
Config.VersionChecker = true
----------------------------------------------------------------
-- Only Required for MSK.RegisterCommand // View Wiki for more Information about that!
Config.Framework = 'esx' -- Set to 'standalone', 'esx' or 'qbcore'
----------------------------------------------------------------
Config.showCoords = {
    enable = true,
    command = 'coords',
    groups = {'superadmin', 'admin'}
}
----------------------------------------------------------------
-- Set to 'native' for FiveM Native Notification
-- Set to 'nui' for NUI Notification
Config.Notification = 'nui'