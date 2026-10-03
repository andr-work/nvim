return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = 'FzfLua',
  keys = {
    { '<leader>ff', function() require('fzf-lua').files() end, desc = 'Find files' },
    { '<leader>fg', function() require('fzf-lua').live_grep() end, desc = 'Grep live' },
    { '<leader>fb', function() require('fzf-lua').buffers() end, desc = 'Find buffers' },
    { '<leader>fh', function() require('fzf-lua').helptags() end, desc = 'Find help' },
    { '<leader>fr', function() require('fzf-lua').oldfiles() end, desc = 'Find recent files' },
    { '<leader>fd', function() require('fzf-lua').diagnostics_document() end, desc = 'Find diagnostics' },
    { '<leader>fk', function() require('fzf-lua').keymaps() end, desc = 'Find keymaps' },
    { '<leader>fc', function() require('fzf-lua').git_status() end, desc = 'Find changed files' },
    { '<leader>f.', function() require('fzf-lua').resume() end, desc = 'Resume last picker' },
  },
  opts = {
    winopts = {
      fullscreen = true,
      -- <F2> で全画面を解除したときのサイズ
      height = 0.85,
      width = 0.85,
      preview = { layout = 'flex' },
    },
  },
}
