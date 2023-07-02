fx_version 'cerulean'
games { 'gta5' }
author 'Szlifike'
description 'Headlights Script'
lua54 'yes'
version '1.0'

shared_script {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
    'config.lua'
}
client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}