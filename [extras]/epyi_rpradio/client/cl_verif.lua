-- # // VARIABLES INIT \\ # --
canStartResource = false

-- # // CREDITS \\ # --
print("^5 epyi_rpradio ^4OpenSource RageUI RP-Radio script that use pma-voice API^0")

-- # // CHECK THE RESOURCE NAME \\ # --
if GetCurrentResourceName() == "epyi_rpradio" then
    canStartResource = true
else
    canStartResource = false
end
