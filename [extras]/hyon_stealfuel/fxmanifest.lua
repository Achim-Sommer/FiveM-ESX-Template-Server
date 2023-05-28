fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

name         'hyon_stealfuel'
version      '1.0.0'
description  'Steal Fuel'


dependencies {
	'es_extended',
	'ox_lib',
	'ox_inventory',
}

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'config.lua'
}

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua'
}