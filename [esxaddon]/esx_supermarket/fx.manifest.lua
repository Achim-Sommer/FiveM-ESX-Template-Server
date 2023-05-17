-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

description 'ESX Supermarket'

version '1.2.1'

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/iransans.otf',
	-- default
	'html/img/default.png',
	'html/img/bread.png',
	'html/img/close.png',
	'html/img/croquettes.png',
	'html/img/water.png',
	'html/img/plus.png',
	'html/img/bulletproof.png',
	'html/img/phone.png',
	'html/img/oxygenmask.png',
	'html/img/fixtool.png',
	'html/img/drill.png',
	'html/img/weaclip.png',
	'html/img/lockpick.png',
	'html/img/mini_c4.png',
	'html/img/normal_c4.png',
	'html/img/keycard.png',
	'html/img/id_card_f.png',
	'html/img/secure_card.png',
	'html/img/laptop_h.png',
	'html/img/weabox.png',
	'html/img/medikit.png',
	'html/img/parkingcard.png',
	'html/img/fishbait.png',
	'html/img/fishingrod.png',
	'html/img/turtlebait.png',
	'html/img/beer.png',
	'html/img/contract.png',
	'html/img/tunerchip.png',
	'html/img/ied.png',
	'html/img/GADGET_PARACHUTE.png',
	'html/img/*.png',
	'html/img/minus.png'
}

ui_page 'html/ui.html'

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/fa.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/fa.lua',
	'config.lua',
	'server/main.lua'
}

shared_script '@es_extended/imports.lua'