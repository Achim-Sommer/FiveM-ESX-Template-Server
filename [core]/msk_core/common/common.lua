local Timeouts, Letters = {}, {}

for i = 48, 57 do table.insert(Letters, string.char(i)) end
for i = 65, 90 do table.insert(Letters, string.char(i)) end
for i = 97, 122 do table.insert(Letters, string.char(i)) end

MSK.GetRandomString = function(length)
    Wait(0)
    if length > 0 then
        return MSK.GetRandomLetter(length - 1) .. Letters[math.random(1, #Letters)]
    else
        return ''
    end
end
MSK.GetRandomLetter = MSK.GetRandomString
exports('GetRandomString', GetRandomString)

MSK.Round = function(num, decimal) 
    return tonumber(string.format("%." .. (decimal or 0) .. "f", num))
end
exports('Round', Round)

MSK.Trim = function(str, bool)
    if bool then return (str:gsub("^%s*(.-)%s*$", "%1")) end
    return (str:gsub("%s+", ""))
end
exports('Trim', Trim)

MSK.Split = function(str, delimiter)
    local result = {}
    
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do 
        table.insert(result, match) 
    end 

    return result 
end
exports('Split', Split)

MSK.TableContains = function(table, value)
    if type(value) == 'table' then
        for k, v in pairs(table) do
            for k2, v2 in pairs(value) do
                if v == v2 then
                    return true
                end
            end
        end
    else
        for k, v in pairs(table) do
            if v == value then
                return true
            end
        end
    end
    return false
end
MSK.Table_Contains = MSK.TableContains
exports('TableContains', TableContains)

MSK.Comma = function(int, tag)
    if not tag then tag = '.' end
    local newInt = int

    while true do  
        newInt, k = string.gsub(newInt, "^(-?%d+)(%d%d%d)", '%1'..tag..'%2')

        if (k == 0) then
            break
        end
    end

    return newInt
end
exports('Comma', Comma)

local Timeout = 0
MSK.SetTimeout = function(ms, cb)
    local requestId = Timeout + 1

    SetTimeout(ms, function()
        if Timeouts[requestId] then Timeouts[requestId] = nil return end
        cb()
    end)

    Timeout = requestId
    return requestId
end
MSK.AddTimeout = MSK.SetTimeout
exports('SetTimeout', SetTimeout)

MSK.DelTimeout = function(requestId)
    if not requestId then return end
    Timeouts[requestId] = true
end
exports('DelTimeout', DelTimeout)

MSK.DumpTable = function(tbl, n)
    if not n then n = 0 end
    if type(tbl) ~= "table" then return tostring(tbl) end
    local s = '{\n'

    for k, v in pairs(tbl) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        for i = 1, n, 1 do s = s .. "    " end
        s = s .. '    ['..k..'] = ' .. MSK.DumpTable(v, n + 1) .. ',\n'
    end

    for i = 1, n, 1 do s = s .. "    " end

    return s .. '}'
end
exports('DumpTable', DumpTable)

MSK.Logging = function(code, ...)
    local script = "[^2"..GetInvokingResource().."^0]"

    if not MSK.Table_Contains({'error', 'debug', 'info'}, code) then
        script = code
        local action = ...
        local args = {...}
        table.remove(args, 1)

        if action == 'error' then
            print(script, '[^1ERROR^0]', table.unpack(args))
        elseif action == 'debug' then
            print(script, '[^3DEBUG^0]', table.unpack(args))
        elseif action == 'info' then
            print(script, '[^4Info^0]', table.unpack(args))
        end
    else
        if code == 'error' then
            print(script, '[^1ERROR^0]', ...)
        elseif code == 'debug' then
            print(script, '[^3DEBUG^0]', ...)
        elseif code == 'info' then
            print(script, '[^4Info^0]', ...)
        end
    end
end
MSK.logging = MSK.Logging
exports('Logging', Logging)

exports('getConfig', function()
    return Config
end)

logging = function(code, ...)
    if not Config.Debug then return end
    
    if code == 'error' then
        print("[^2msk_core^0]", '[^1ERROR^0]', ...)
    elseif code == 'debug' then
        print("[^2msk_core^0]", '[^3DEBUG^0]', ...)
    elseif code == 'info' then
        print("[^2msk_core^0]", '[^4Info^0]', ...)
    end
end