-- Insert you Discord Webhook here
local webhookLink = "https://discord.com/api/webhooks/10108866828"
local warningLink = "https://discord.com/api/webhooks/10108866828"
local attentionLink = "https://discord.com/api/webhooks/10108866828"

sendDiscordLog = function(action, playerId, account, money)
	if not Config.DiscordLog then return end
	local desc, titledesc = '', ''

	if action == 'set' then 
		action = 'SET'
		desc = ('The %s Money from Player %s (ID: %s) was set to %s'):format(account:upper(), GetPlayerName(playerId), playerId, '$'..MSK.Comma(money))
	elseif action == 'add' then
		action = 'ADDED'
		desc = ('Player %s (ID: %s) ADDED %s to his/her %s Money'):format(GetPlayerName(playerId), playerId, '$'..MSK.Comma(money), account:upper())
	elseif action == 'remove' then
		action = 'REMOVED'
		desc = ('Player %s (ID: %s) REMOVED %s to his/her %s Money'):format(GetPlayerName(playerId), playerId, '$'..MSK.Comma(money), account:upper())
	end

	local webhook, botColor, botName, botAvatar = webhookLink, Config.botColor, Config.botName, Config.botAvatar
	local rolePing = 0

	if money >= Config.Warning.amount then 
		webhook = warningLink 
		botColor = Config.Warning.color
		titledesc = ' - WARNING'
		if Config.Warning.pingRole.enable then rolePing = Config.Warning.pingRole.roleId end
	end

	if money >= Config.Attention.amount then 
		webhook = attentionLink 
		botColor = Config.Attention.color
		titledesc = ' - ATTENTION'
		if Config.Attention.pingRole.enable then rolePing = Config.Attention.pingRole.roleId end
	end

	local title = "MSK Moneychecker" .. titledesc
	local description = desc
	local fields = {
		{name = "Action", value = action, inline = true},
		{name = "Account", value = account:upper(), inline = true},
		{name = "Amount", value = '$'..MSK.Comma(money), inline = true},
		{name = "Ping", value = (rolePing > 0 and '<@&'..rolePing..'>') or 'not nessecary', inline = true},
	}
	local footer = {
		text = "© MSK Scripts", 
		link = "https://i.imgur.com/PizJGsh.png"
	}
	local time = "%d/%m/%Y %H:%M:%S" -- format: "day/month/year hour:minute:second"

	addDiscordLog(webhook, botColor, botName, botAvatar, title, description, fields, footer, time)
end

addDiscordLog = function(webhook, botColor, botName, botAvatar, title, description, fields, footer, time)
	MSK.AddWebhook(webhook, botColor, botName, botAvatar, title, description, fields, footer, time)
end