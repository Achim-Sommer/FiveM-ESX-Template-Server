fx_version 'adamant'

game 'gta5'

name 'B1G'
author 'B1G - https://github.com/CarlosVergikosk'
version 'v1.0'

ui_page {
    'html/ui.html'
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css'
}

client_scripts {
	'client/main.lua'
}

server_scripts {
	'server/main.lua'
}

export {
	'Notify'
}

dependencies {
	'es_extended'
}