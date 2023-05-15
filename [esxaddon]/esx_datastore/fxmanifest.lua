fx_version 'adamant'

game 'gta5'

description 'ESX Data Store'

version '1.0'
legacyversion '1.9.1'


lua54 'yes'

server_scripts {
	'@es_extended/imports.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/classes/datastore.lua',
	'server/main.lua'
}
