if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

function ShowNotification(text)
	ESX.ShowNotification(text)
end

function ServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb,  ...)
end

RegisterNetEvent(GetCurrentResourceName()..":showNotification", function(text)
    ShowNotification(text)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
    TriggerServerEvent("pickle_prisons:initializePlayer")
end)

RegisterNetEvent('esx:onPlayerDeath', function()
    CheckBreakout = false
end)

RegisterNetEvent('esx:onPlayerSpawn', function()
    TeleportHospital()
    CheckBreakout = true
end)

function ToggleOutfit(inPrison)
    if inPrison then 
        local prison = Config.Prisons[Prison.index]
        local outfits = prison.outfit or Config.Default.outfit
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local gender = skin.sex
            local outfit = gender == 1 and outfits.female or outfits.male
            if not outfit then return end
            TriggerEvent('skinchanger:loadClothes', skin, outfit)
        end)
    else
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('esx:restoreLoadout')
        end)
    end
end

-- Inventory Fallback

CreateThread(function()
    Wait(100)
    
    if InitializeInventory then return InitializeInventory() end -- Already loaded through inventory folder.

    Inventory = {}

    Inventory.Items = {}
    
    Inventory.Ready = false
    
    RegisterNetEvent("pickle_prisons:setupInventory", function(data)
        Inventory.Items = data.items
        Inventory.Ready = true
    end)
end)