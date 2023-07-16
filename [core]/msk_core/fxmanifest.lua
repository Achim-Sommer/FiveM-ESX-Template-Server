fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_core'
description 'Core functions for MSK Scripts'
version '1.7.6'

lua54 'yes'

shared_scripts {
    'config.lua',
    'config_*.lua'
}

client_scripts {
    'client.lua',
    'client_*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
    'server_*.lua'
}

ui_page 'html/index.html'

files {
	"html/**/*.*",
    'import.lua'
}

dependencies {
    'oxmysql'
}