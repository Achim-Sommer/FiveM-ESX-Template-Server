ESX = exports['es_extended']:getSharedObject()

local options = {}
for _,v in ipairs(Config.Headlights) do
    table.insert(options, {
        title = v.label,
        icon = 'lightbulb',
        iconColor = v.iconColor,
        disabled = disabled,
        onSelect = function()
          local veh = GetVehiclePedIsUsing(PlayerPedId())
          ToggleVehicleMod(veh, 22, true)
          SetVehicleHeadlightsColour(veh, v.index)
          TriggerServerEvent('ws_headlights:removeItem', source)
        end
    })
end

RegisterNetEvent('ws_headlights:itemUse')
AddEventHandler('ws_headlights:itemUse', function(source)
  lib.registerContext({
    id = 'headlight_menu',
    title = 'Xenon Lights',
    options = options
  })
  lib.showContext('headlight_menu')
end)

RegisterNetEvent('ws_headlights:not_in_vehicle_notify')
AddEventHandler('ws_headlights:not_in_vehicle_notify', function(source)
  lib.notify({
    title = 'Hiba',
    description = 'Nem ülsz járműben!',
    type = 'error',
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = {
          color = '#909296'
        }
    },
})
end)
