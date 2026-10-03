local parsers = {
  'bash', 'c', 'css', 'diff', 'dockerfile', 'git_config', 'gitcommit', 'go',
  'html', 'java', 'javascript', 'json', 'kotlin', 'lua', 'luadoc', 'markdown',
  'markdown_inline', 'python', 'query', 'regex', 'sql', 'toml', 'tsx',
  'typescript', 'vim', 'vimdoc', 'xml', 'yaml',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').setup()

    -- 未インストールのパーサだけ非同期で取得する
    require('nvim-treesitter').install(parsers)

    -- パーサがある filetype でハイライトと折りたたみを有効化
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('conf-treesitter-start', { clear = true }),
      callback = function(ev)
        if not pcall(vim.treesitter.start, ev.buf) then return end
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end,
    })
  end,
}
