-- leader はプラグイン読み込みより先に決める必要がある
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('config.options')
require('config.lazy')
require('config.keymaps')
require('config.autocmds')
