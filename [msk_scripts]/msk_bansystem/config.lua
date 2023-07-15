Config = {}
----------------------------------------------------------------
Config.VersionChecker = false
Config.Debug = true
----------------------------------------------------------------
-- Add the Webhook Link in server_discordlog.lua
Config.DiscordLog = true
Config.botColor = "6205745" -- https://www.mathsisfun.com/hexadecimal-decimal-colors.html
Config.botName = "MSK Scripts"
Config.botAvatar = "https://i.imgur.com/PizJGsh.png"
----------------------------------------------------------------
-- !!! This function is clientside AND serverside !!!
Config.Notification = function(source, message)
    if IsDuplicityVersion() then -- serverside
        MSK.Notification(source, 'MSK Bansystem', message)
    else -- clientside
        MSK.Notification('MSK Bansystem', message)
    end
end
----------------------------------------------------------------
Config.Commands = {
    enable = true, -- Set false to disable the Command
    groups = {'admin', 'god'},
    ban = 'ban',
    unban = 'unban'
}