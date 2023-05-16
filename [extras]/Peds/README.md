# FiveM NPC Addon

**Requirements:**
[IPL Pack] https://github.com/Bob74/bob74_ipl (or other to load DLC Interiors)



**add to server.cfg**
```
start Peds
```
(you can rename folder)


*Optional (ESX JOB):*
[esx_nightclub] https://github.com/SFL-Master/esx_nightclub

**Config Options:**
```
Config = {}


Config.EnableShops                = true    -- If true spawn Some Shop & Interior NPCs

--Cops--
Config.EnableCops                 = true    -- If true spawn All Cops at Departments
--Cops--

--Nightclub--
Config.EnableNightclubs           = true    -- If true spawn Nightclub NPCs (Need a IPL Loader https://github.com/Bob74/bob74_ipl or other) (After Hours DLC)
Config.EnableSolomun              = true    -- If true spawn Solomun at Nightclub DJ
Config.EnableDixon                = false   -- If true spawn Dixon at Nightclub DJ
--Nightclub--

--Biker DLC--
Config.EnableDrugs                = true    -- If true spawn NPCs & Guards at Druglabors (Biker DLC)
Config.EnableWeapons              = true    -- If true spawn Guards with Weapons (can change in ped.lua)
--Biker DLC--
```
