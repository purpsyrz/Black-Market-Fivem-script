fx_version 'cerulean'
game 'gta5'

author 'fill_ma_hooters'
description 'Custom Black Market System for ESX'
version '1.0.0'

-- Server scripts
server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'server/main.lua'
}

-- Client scripts
client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'client/main.lua'
}

-- UI
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/images/*.png'
}

-- Shared scripts
shared_scripts {
    'config.lua'
}
