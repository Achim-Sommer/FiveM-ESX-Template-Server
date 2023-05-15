RegisterNetEvent('b1g_notify:client:Notify')
AddEventHandler('b1g_notify:client:Notify', function(data)
	Notify(data.type, data.text)
end)

function Notify(type, text)
	SendNUIMessage({
		type = type,
		text = text
	})
end

RegisterCommand('adm', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	TriggerServerEvent('Notify:admNotifyCheck', msg)
end)

RegisterCommand('msg', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	exports['b1g_notify']:Notify('msg', msg)
end)

RegisterCommand('true', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	exports['b1g_notify']:Notify('true', msg)
end)

RegisterCommand('money', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	exports['b1g_notify']:Notify('money', msg)
end)

RegisterCommand('dispatch', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	exports['b1g_notify']:Notify('dispatch', msg)
end)

RegisterCommand('false', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	exports['b1g_notify']:Notify('false', msg)
end)

RegisterCommand('light', function(source, args, rawCommand)
	local msg = table.concat(args, " ")
	exports['b1g_notify']:Notify('light', msg)
end)