ProgressStart = function(time, text, color)
    SendNUIMessage({
        action = 'progressBarStart',
        time = time,
        text = text or '',
        color = color or Config.progressColor,
    })
end
MSK.ProgressStart = ProgressStart
exports('ProgressStart', ProgressStart)

ProgressStop = function()
    SendNUIMessage({
        action = 'progressBarStop',
    })
end
MSK.ProgressStop = ProgressStop
exports('ProgressStop', ProgressStop)