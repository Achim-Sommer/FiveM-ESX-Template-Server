fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'ausi22#0001'
description 'description'

shared_scripts {
  '@es_extended/imports.lua',
  'config.lua'
}

client_scripts {
  'client/*.lua'
}

server_scripts {
  'server/*.lua'
}

ui_page 'html/index.html'

files {
  'html/*.html',
  'html/css/*.css',
  'html/js/*.js',
}