# msk_core
**[STANDALONE]** Core functions for MSK Scripts

**!!! Please read the [WIKI Page](https://github.com/MSK-Scripts/msk_core/wiki) for more Information about the functions !!!**

If you have any suggestions, feel free to contact me at the [MSK Scripts Discord](https://discord.gg/5hHSBRHvJE)

## Important
You can only use the Export **OR** the Import!

## Export
You have to add this at the top of your clientside and serverside file
```lua
MSK = exports.msk_core:getCoreObject()
```

## Import
You can add the following to the fxmanifest.lua to get MSK
```lua
shared_script '@msk_core/import.lua'
```

## Resmon
**Idle: 0.00 ms**

![Screenshot_173](https://user-images.githubusercontent.com/49867381/205465609-26f96507-e080-4fb0-b450-4dc44e64203d.png)

**Usage: little higher**

## Functions
* [COMMON](https://github.com/MSK-Scripts/msk_core/wiki/Common) - *clientside **AND** serverside functions*
* [CLIENTSIDE](https://github.com/MSK-Scripts/msk_core/wiki/Clientside) - *clientside functions only*
* [SERVERSIDE](https://github.com/MSK-Scripts/msk_core/wiki/Serverside) - *serverside functions only*

## Requirements
* oxmysql
