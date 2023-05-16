local function getESX()
	local ESX = exports['es_extended']:getSharedObject()

	-- Already handled internally
	if ESX.GetConfig().OxInventory then return end

	if ESX.SearchInventory then
		return {
			PlayerLoaded = ESX.PlayerLoaded,
			SearchInventory = ESX.SearchInventory
		}
	else
		-- Backwards compatibility for versions prior to 1.5
		ESX = {
			PlayerLoaded = ESX.PlayerLoaded,
			GetPlayerData = ESX.GetPlayerData
		}

		function ESX.SearchInventory()
			local inventory = ESX.GetPlayerData().inventory

			for _, item in pairs(inventory) do
				if item.name == 'phone' then
					return 1
				end
			end
		end
	end
end

local ESX = getESX()

if not ESX then return end

AddEventHandler('onClientResourceStart', function(resource)
	if resource == 'es_extended' then
		ESX = getESX()
	end
end)

local npwd = exports.npwd

if ESX.PlayerLoaded and ESX.SearchInventory('phone', true) > 0 then
	npwd:setPhoneDisabled(false)
else
	npwd:setPhoneDisabled(true)
end

RegisterNetEvent('esx:playerLoaded', function()
	if ESX.SearchInventory('phone', true) > 0 then
		npwd:setPhoneDisabled(false)
	end
end)

RegisterNetEvent('esx:onPlayerLogout', function()
	npwd:setPhoneVisible(false)
	npwd:setPhoneDisabled(true)
end)

RegisterNetEvent('esx:removeInventoryItem', function(item, count)
	if item == 'phone' and count == 0 then
		npwd:setPhoneDisabled(true)
	end
end)

RegisterNetEvent('esx:addInventoryItem', function(item, count)
	if item == 'phone' then
		npwd:setPhoneDisabled(false)
	end
end)
