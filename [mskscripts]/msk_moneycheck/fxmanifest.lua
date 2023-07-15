fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_moneycheck'
description 'Moneychecker with Discordlogs'
version '1.1'

lua54 'yes'

shared_scripts {
	'@msk_core/import.lua',
	'config.lua'
}

server_scripts {
	'server.lua',
	'server_*.lua'
}

dependencies {
	'msk_core'
}