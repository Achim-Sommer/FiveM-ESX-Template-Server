-- # // VERSION CHECKER \\ # --
-- # // VARIABLES INIT \\ # --
canStartResource = false

Citizen.CreateThread( function()
    function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version")
        if curVersion ~= nil then
            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("^5epyi_rpradio ^4is not up to date. The latest release is "..responseText.." but you are on release "..curVersion.." -- > https://github.com/J4thgit/epyi_rpradio")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("^5epyi_rpradio ^4It looks like github is offline. The resource uses github to check if it's up to date. This does not prevent the resource from working.")
            end
        else
            print("^5epyi_rpradio ^4It looks like your ressource's version checker is broken. If you want to patch this, go download an official release of this script at -- > https://github.com/J4thgit/epyi_rpradio")
        end
    end
    PerformHttpRequest("https://raw.githubusercontent.com/J4thgit/epyi_rpradio/main/version", checkVersion, "GET")
end)

-- # // CHECK THE RESOURCE NAME \\ # --
if GetCurrentResourceName() == "epyi_rpradio" then
    canStartResource = true
else
    canStartResource = false
end
