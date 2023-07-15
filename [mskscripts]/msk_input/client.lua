local isOpen = false
local callback = {}

openInput = function(header, placeholder, field, cb)
    if isOpen then return print('Input is already open') end
    if not cb then callback = field else callback = cb end

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openInput",
        header = header,
        placeholder = placeholder,
        field = field and type(field) == 'boolean'
    })
    isOpen = true
end
exports('openInput', openInput)

closeInput = function()
    SetNuiFocus(false, false)
	isOpen = false
end
exports('closeInput', closeInput)

RegisterNUICallback('close', function(data)
    callback()
    closeInput()
end)

RegisterNUICallback('submit', function(data)
	callback(data.input)
    closeInput()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        closeInput()
    end
end)