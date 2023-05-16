local categories = Config.categories
local inMenu = false

--==== NUI ====--
function openUI()
	SetNuiFocus(true, true)
	inMenu = true
	SendNUIMessage({
		type = 'setUIVisible',
		bool = true,
		categories = categories,
	})
end

function closeUI(fromCommand)
	SetNuiFocus(false, false)
	inMenu = false
	if fromCommand then
		SendNUIMessage({
			type = 'setUIVisible',
			bool = false,
		})
	end
end

function onCommand()
	if not inMenu then
		openUI()
	else
		closeUI(true)
	end
end

RegisterNetEvent("s1lent_keybinds:openUI") AddEventHandler("s1lent_keybinds:openUI", function() openUI() end)

RegisterNUICallback('closeUI', function(data)
    closeUI(false)
end)

--==== Commands ====--
RegisterCommand('keybinds', function(source, args, rawCommand)
	onCommand()
end, false)
TriggerEvent('chat:addSuggestion', '/keybinds', 'Open keybinds/commands menu', {})

RegisterCommand('commands', function(source, args, rawCommand)
	onCommand()
end, false)
TriggerEvent('chat:addSuggestion', '/commands', 'Open keybinds/commands menu', {})

--==== Resource Start/Stop ====--
AddEventHandler('onResourceStop', function (resourceName)
	if (GetCurrentResourceName() == resourceName) then
        closeUI()
	end
end)

AddEventHandler('onResourceStart', function (resourceName)
	if (GetCurrentResourceName() == resourceName) then
		closeUI()
	end
end)