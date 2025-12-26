fx_version 'cerulean'
game 'gta5'

lua54 'yes'

client_script 'client.lua'

shared_script {
	'@ox_lib/init.lua',
	'config.lua'
}

files {
	'data/obsongs_sound.dat54.rel',
	'data/obsongs_game.dat151.rel',
	'songdirectory/*.awc',
}

dependency {
	'ox_lib'
}

data_file 'AUDIO_WAVEPACK' 'songdirectory'
data_file 'AUDIO_SOUNDDATA' 'data/obsongs_sound.dat'
data_file 'AUDIO_GAMEDATA' 'data/obsongs_game.dat'
