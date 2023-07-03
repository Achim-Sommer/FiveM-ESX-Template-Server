fx_version 'adamant'

game 'gta5'

description 'fivem_pets'

version '1.0.0'

ui_page 'html/ui.html'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
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
	'client/main.lua'
}

files {
	'html/ui.html',
	'html/css/style.css',
	'html/fonts/UVNBaiSau_R.ttf',
	'html/js/script.js',
	'html/img/button/buy.png',
	'html/img/button/buy_hover.png',
	'html/img/berger.png',
	'html/img/caniche.png',
	'html/img/carlin.png',
	'html/img/chat.png',
	'html/img/chien.png',
	'html/img/chop.png',
	'html/img/cochon.png',
	'html/img/husky.png',
	'html/img/lapin.png',
	'html/img/retriever.png',
	'html/img/westie.png',
}
