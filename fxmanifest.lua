-- FX Information --
fx_version   'cerulean'
lua54        'yes'
use_fxv2_oal 'yes'
games        { 'gta5' }

-- Resource Information --
version '0.0.0'
author       'MrLutin'
repository   "https://github.com/MrLutin/mrlutin_hud"
description  'Custom version of dx_hud made by mrlutin'

-- Manifest --
dependencies {
    '/onesync',
    'mrlutin_lib',
}

files {
    'locales/*.json',
}

shared_scripts {
    '@mrlutin_lib/imports.lua',
    'config.lua',
    'init.lua',
}

client_scripts {
    'bridge/*.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua'
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/**/*'
}