fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_core'
description 'Core functions for MSK Scripts'
version '1.9.3'

lua54 'yes'

shared_scripts {
    'config.lua',
    'config_*.lua'
}

client_scripts {
    'client/client.lua',
    'client/client_*.lua',
    'common/common.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/server_*.lua',
    'common/common.lua',
}

ui_page 'html/index.html'

files {
	"html/**/*.*",
    'import.lua'
}

dependencies {
    'oxmysql'
}