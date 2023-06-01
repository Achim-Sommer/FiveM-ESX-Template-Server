local Config = nil

local function createBlip(coords, name, id, colour, scale) 
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipDisplay(blip, 4)
    SetBlipAsShortRange(blip, true)
    SetBlipSprite(blip, id)
    SetBlipColour(blip, colour)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
end

local function setLocale()
    SendNUIMessage({
        type = 'set-locale',
        locale = Locales[Config.locale]['ui']
    })
end

local function openShop(items, filters, name, description)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'main-container',
        show = true
    })
    setLocale()
    SendNUIMessage({
        type = 'shop-container',
        name = name,
        description = description,
        items = items,
        filters = filters
    })
end

CreateThread(function()
    -- This wait only aplies when restarting script ingame
    Wait(500)
    local config = lib.callback.await('fuksus-shops:getConfig', false)

    Config = config

    for type,data in pairs(Config.shops) do
        for i=1, #data.locations do
            if data.blip then
                createBlip(data.locations[i], data.name, data.blip.id, data.blip.colour, data.blip.scale)
            end   

            local point = lib.points.new({
                coords = data.locations[i],
                distance = 5,
                items = data.items,
                filters = data.filters,
                name = data.name,
                description = data.description
            })

            function point:nearby()
                DrawMarker(Config.marker.type, self.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker.scale.x, Config.marker.scale.y, Config.marker.scale.z, Config.marker.color.r, Config.marker.color.g, Config.marker.color.b, Config.marker.color.a, false, Config.marker.face, 2, false, false, false, false) 

                if self.isClosest and self.currentDistance < 1.2 and IsControlJustReleased(0, 38) then
                    openShop(self.items, self.filters, self.name, self.description)
                end
            end
        end
    end
end)

RegisterNUICallback('closeUi', function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'main-container',
        show = false
    })
end)

RegisterNUICallback('buy', function(data, cb)
    lib.callback('fuksus-shops:buyItems', false, function(success)
        cb(success)
    end, data)
end)