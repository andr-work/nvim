-- 使わない remote plugin provider を無効化する
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local o = vim.o

-- 表示
o.number = false
o.relativenumber = false
o.cursorline = true
o.signcolumn = 'auto'
o.wrap = false
o.scrolloff = 4
o.sidescrolloff = 8
o.pumheight = 10
o.termguicolors = true
o.winborder = 'rounded'
-- 背景は透過させているので擬似透過は噛み合わない
o.winblend = 0
-- モードは lualine が出す
o.showmode = false
o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 編集
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.shiftround = true
o.smartindent = true
o.undofile = true
o.swapfile = false
o.confirm = true
-- ヤンクとシステムクリップボードを共有する
o.clipboard = 'unnamedplus'
o.virtualedit = 'block'

-- 検索・置換
o.ignorecase = true
o.smartcase = true
o.inccommand = 'split'

-- ウィンドウ
o.splitbelow = true
o.splitright = true
o.splitkeep = 'screen'

-- 折りたたみは treesitter に任せ、開いた状態で始める
o.foldlevel = 99

-- 応答性
o.updatetime = 200
o.timeoutlen = 400
