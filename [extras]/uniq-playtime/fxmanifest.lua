--[[ FX Information ]] --
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
author 'uniq-team'
version '1.3'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'
server_script '@oxmysql/lib/MySQL.lua'
server_script 'server.lua'
client_script 'client.lua'
