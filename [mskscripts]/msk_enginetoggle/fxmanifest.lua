fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_enginetoggle'
description 'EngineToggle for Vehicles'
version '3.7.5'

lua54 'yes'

shared_script {
    'config.lua',
	'translation.lua'
}

client_scripts {
	'client.lua'
}

server_scripts {
	'server.lua'
}

dependencies {
	'msk_core'
}