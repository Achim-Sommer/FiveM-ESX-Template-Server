fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_bansystem'
description 'Simple Ban System'
version '1.1'

lua54 'yes'

shared_scripts {
	'@msk_core/import.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua',
	'server_*.lua'
}

dependencies {
	'oxmysql',
	'msk_core'
}