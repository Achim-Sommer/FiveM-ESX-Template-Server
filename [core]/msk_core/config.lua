Config = {}
----------------------------------------------------------------
Config.Debug = true
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
-- Set to 'msk' for NUI Notification
-- Set to 'okok' for OKOK Notification
Config.Notification = 'msk'

Config.progressColor = "#5eb131" -- Default Color for ProgressBar