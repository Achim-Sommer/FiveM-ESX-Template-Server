-- Insert you Discord Webhook here
local webhookLink = "https://discord.com/api/webhooks/10108866828"

banLog = function(source, bannedby, targetId, time, reason, playerIds)
	if not Config.DiscordLog then return end

	local botColor = Config.botColor
	local botName = Config.botName
	local botAvatar = Config.botAvatar
	local title = "MSK Bansystem"
	local description = ('Player %s (ID: %s) banned the Player %s (ID: %s) for %s until %s'):format(bannedby, source or 0, GetPlayerName(targetId), targetId, reason, time)
	local fields = {
		{name = "Some IDs", value = playerIds},
	}
	local footer = {
		text = "© MSK Scripts", 
		link = "https://i.imgur.com/PizJGsh.png"
	}
	local time = "%d/%m/%Y %H:%M:%S" -- format: "day/month/year hour:minute:second"

	addDiscordLog(botColor, botName, botAvatar, title, description, fields, footer, time)
end

unbanLog = function(source, unbannedby, banId)
	if not Config.DiscordLog then return end

	local botColor = Config.botColor
	local botName = Config.botName
	local botAvatar = Config.botAvatar
	local title = "MSK Bansystem"
	local description = ('Player %s (ID: %s) unbanned BanID %s'):format(unbannedby, source or 0, banId)
	local fields = false
	local footer = {
		text = "© MSK Scripts", 
		link = "https://i.imgur.com/PizJGsh.png"
	}
	local time = "%d/%m/%Y %H:%M:%S" -- format: "day/month/year hour:minute:second"

	addDiscordLog(botColor, botName, botAvatar, title, description, fields, footer, time)
end

addDiscordLog = function(botColor, botName, botAvatar, title, description, fields, footer, time)
	MSK.AddWebhook(webhookLink, botColor, botName, botAvatar, title, description, fields, footer, time)
end