fx_version 'bodacious'
game 'gta5'

author 'kac5a'
description 'K5 Notify'
version '1.0'

client_scripts {
	'client/main.lua'
}

ui_page "html/index.html"

files({
    'html/**.**',
    'html/assets/**'
})

export "notify"