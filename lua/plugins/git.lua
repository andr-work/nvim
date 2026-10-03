-- 差分サインと hunk 移動のみ。ステージや blame は使わない
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '▁' },
      topdelete = { text = '▔' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    -- ステージ済み hunk に別サインを出すと意味が増えるので切る
    signs_staged_enable = false,
    on_attach = function(buf)
      local gs = require('gitsigns')
      local map = function(lhs, direction, desc)
        vim.keymap.set('n', lhs, function()
          -- diff 表示中は組み込みの ]c/[c をそのまま通す
          if vim.wo.diff then return lhs end
          vim.schedule(function() gs.nav_hunk(direction) end)
          return '<Ignore>'
        end, { buffer = buf, desc = desc, expr = true })
      end
      map(']c', 'next', 'Next hunk')
      map('[c', 'prev', 'Prev hunk')
    end,
  },
}
