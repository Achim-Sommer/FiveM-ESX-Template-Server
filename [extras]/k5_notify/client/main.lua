local k5NotifSettingsOpen = false

Citizen.CreateThread(function()
end)

RegisterNetEvent("k5_notify:notify")
AddEventHandler("k5_notify:notify", function(title, text, type, duration)
  notify(title, text, type)
end)

function notify(title, text, type, duration)
  SendNUIMessage({
    action = "notify",
    data = {
      title = title,
      text = text,
      type = type,
      duration = duration
    }
  })
end

RegisterCommand('notifysettings', function()
  if k5NotifSettingsOpen then
    closeSettings() 
  else
    k5NotifSettingsOpen = true
    SendNUIMessage({
      action = "settings"
    })
    SetNuiFocus(true, true)
  end
end)

function closeSettings()
  k5NotifSettingsOpen = false
  SendNUIMessage({
    action = "closeSettings"
  })
  SetNuiFocus(false, false)
end


RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		closeSettings()
  end
end)

-- You can remove these commands.
-- These are only examples, but
-- they show up in the chat
-- suggestions.

RegisterCommand('success', function()
  notify('K5 Notify', 'This is a test notification', 'success', 5000)
end)

RegisterCommand('error', function()
  notify('K5 Notify', 'This is a test notification', 'error', 1000)
end)

RegisterCommand('warn', function()
  notify('K5 Notify', 'This is a test notification', 'warn', 10000)
end)

RegisterCommand('info', function()
  notify('K5 Notify', 'This is a test notification', 'info')
end)

RegisterCommand('custom', function()
  notify('K5 Notify', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id ex enim. Curabitur ultrices lorem tempus velit tincidunt, ac fermentum lorem suscipit. Pellentesque auctor sapien et leo iaculis viverra. Integer in consectetur ligula. In hac habitasse platea dictumst. Phasellus dui libero, imperdiet vitae vulputate et, pharetra auctor justo.', 'k5style')
end)
