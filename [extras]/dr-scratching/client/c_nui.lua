local inMenu = false

RegisterNetEvent("dr-scratching:nuiOpenCard")
AddEventHandler("dr-scratching:nuiOpenCard", function(key, price, amount, price_type)
  if inMenu then return end
  SetNuiFocus(true, true)
  SendNUIMessage({
    type = 'openScratch',
    key = key,
    price = price,
    amount = amount,
    price_type = price_type,
    win_message = _U('scratch_won'),
    lose_message = _U('scratch_lost'),
    currency = _U('currency'),
    scratchAmount = Config.ScratchAmount,
    resourceName = GetCurrentResourceName(),
    debug = debugIsEnabled
  })
  inMenu = true
end)

RegisterNUICallback('nuiCloseCard', function(data)
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeScratch'})
  TriggerEvent("dr-scratching:stopScratchingEmote")
  TriggerServerEvent('dr-scratching:stopScratching', data.price, data.amount, data.type)
  inMenu = false
end)