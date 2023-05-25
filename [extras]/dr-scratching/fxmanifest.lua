fx_version 'cerulean'
game 'gta5'

description 'Start scratching! Odds Are Meant To Be Beaten'
author 'Dream Resources' -- https://forum.cfx.re/u/xDreamLand/summary
version '3.3.0'
repository 'https://github.com/xDreamLand/dr-scratching'

lua54 'yes'

shared_scripts {
  '@es_extended/imports.lua', 
  '@es_extended/locale.lua' 
}

server_scripts {
    'locales/en.lua',
    'locales/de.lua',
    'config.lua',

    'shared/utils.lua',
    'server/s_main.lua',
    'server/s_webhooks.lua',
    'server/s_version.lua'
}

client_scripts {
    'locales/en.lua',
    'locales/de.lua',
    'config.lua',

    'client/c_main.lua',
    'client/c_nui.lua',
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/js/*.js',
    'html/css/*.css',
    'html/img/*.png',
    'html/img/*.jpg'
}
