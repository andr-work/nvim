-- 起動時と同じく全画面で開くため、トグルは自前で組む
local function toggle(dir)
  if vim.bo.filetype == 'oil' then
    require('oil').close()
  else
    require('oil').open(dir)
  end
end

return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- netrw を置き換えるので遅延させない
  lazy = false,
  keys = {
    { '-', '<Cmd>Oil<CR>', desc = 'Open parent directory' },
    { '<leader>e', function() toggle() end, desc = 'Explorer' },
    { '<leader>E', function() toggle(vim.fn.getcwd()) end, desc = 'Explorer (cwd)' },
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
    keymaps = {
      -- 既定の <C-h>/<C-l> はウィンドウ移動と衝突するので潰す
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      ['q'] = { 'actions.close', mode = 'n' },
    },
  },
}
