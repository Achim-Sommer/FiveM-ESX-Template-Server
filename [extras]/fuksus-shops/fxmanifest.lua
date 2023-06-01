fx_version 'cerulean'
games { 'rdr3', 'gta5' }

lua54 'yes'

author 'Fuksus Boost#4383'
description 'Fuksus shops'
version '1.0.0'

ui_page 'ui/dist/index.html'

shared_scripts{
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'locales.lua'
}

client_scripts{
    'client/*.lua'
}

server_scripts{
    'config.lua',
    'server/*.lua'
}

files {
    'ui/dist/**'
}

dependencies {
	'ox_inventory',
    'es_extended',
	'ox_lib',
}
