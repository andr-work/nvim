local augroup = function(name)
  return vim.api.nvim_create_augroup('conf-' .. name, { clear = true })
end

-- ヤンクした範囲を一瞬光らせる
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight-yank'),
  callback = function() vim.hl.on_yank() end,
})

-- 0.11 以降 grn/gra/grr/gri/grt/gO/K は組み込み済みなので不足分だけ足す
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup('lsp-attach'),
  callback = function(ev)
    local fzf = function(picker)
      return function() require('fzf-lua')[picker]() end
    end
    local bmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = ev.buf, desc = desc })
    end
    bmap('gd', fzf('lsp_definitions'), 'Go to definition')
    bmap('gD', fzf('lsp_declarations'), 'Go to declaration')
    bmap('<leader>fs', fzf('lsp_document_symbols'), 'Document symbols')
    bmap('<leader>fS', fzf('lsp_live_workspace_symbols'), 'Workspace symbols')
  end,
})

-- 最後に開いていた位置へ戻る
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup('last-location'),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
