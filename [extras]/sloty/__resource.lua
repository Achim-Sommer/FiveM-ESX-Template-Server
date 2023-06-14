resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/ui.html'

client_scripts {
	'config.lua',
	'client.lua'
}

server_scripts {
	'server.lua',
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
}

files {
  'html/ui.html',
  'html/script.js',
  'html/design.css',
  -- Images
  'html/img/black.png',
  'html/img/item1.png',
  'html/img/item2.png',
  'html/img/item3.png',
  'html/img/item4.png',
  'html/img/item5.png',
  'html/img/item6.png',
  'html/img/item7.png',
  'html/img/red.png',
  'html/img/lever.png',
  -- Audio
  'html/audio/alarma.wav',
  'html/audio/apasaButonul.wav',
  'html/audio/changeBet.wav',
  'html/audio/collect.wav',
  'html/audio/pornestePacanele.wav',
  'html/audio/seInvarte.wav',
  'html/audio/winDouble.wav',
  'html/audio/winLine.wav'
}
