fx_version "cerulean"
game "gta5"

name "epyi_rpradio"
description "Une radio qui utilise l'API Radio de pma-voice"
author "Epyi (https://discord.gg/VyRPheG6Es)"
version "1.0.0"

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/on.ogg",
	"ui/off.ogg",
}

shared_scripts {
    "@es_extended/imports.lua"
}
client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    "RageUI/menu/Function.lua",
    "config.lua",
    "client/cl_verif.lua",
	"client/cl_main.lua",
    "client/cl_functions.lua"
}
server_scripts {
    "config.lua",
    "server/sv_verif.lua",
	"server/sv_main.lua",
    "server/sv_functions.lua"
}

dependencies {
	"es_extended",
	"pma-voice"
}