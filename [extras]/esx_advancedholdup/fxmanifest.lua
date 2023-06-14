fx_version 'adamant'

game 'gta5'

description 'ESX Advanced Holdup'

Author 'Human Tree92 | Velociti Entertainment'

version '1.0.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/de.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/de.lua',
	'config.lua',
	'client/main.lua',
}

dependencies {
	'es_extended',
	'esx_policejob'
}
