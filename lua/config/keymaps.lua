local map = vim.keymap.set

-- Esc が遠いので insert を jk で抜ける
map('i', 'jk', '<Esc>', { desc = 'Escape' })

-- 行・選択範囲を上下に動かす
map('n', '<M-j>', '<Cmd>move .+1<CR>==', { desc = 'Move line down' })
map('n', '<M-k>', '<Cmd>move .-2<CR>==', { desc = 'Move line up' })
map('i', '<M-j>', '<Esc><Cmd>move .+1<CR>==gi', { desc = 'Move line down' })
map('i', '<M-k>', '<Esc><Cmd>move .-2<CR>==gi', { desc = 'Move line up' })
map('v', '<M-j>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<M-k>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- ウィンドウ移動
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- 検索ハイライトを消す
map('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- 折り返し行でも見た目どおりに動く j/k
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = 'Down' })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = 'Up' })

-- インデント後も選択を保つ
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

map('n', '<leader>cf', function() vim.lsp.buf.format() end, { desc = 'Format buffer' })
