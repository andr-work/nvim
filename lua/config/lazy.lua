-- lazy.nvim 本体が無ければ取得する
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local out = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'lazy.nvim の取得に失敗しました\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- lua/plugins/ 配下の spec を全部読む
  spec = { { import = 'plugins' } },
  install = { colorscheme = { 'tokyonight-moon' } },
  checker = { enabled = false },
  change_detection = { notify = false },
  -- 全画面にするので枠は消す。枠ありだと row/col が -1 されて画面外に出る
  ui = { size = { width = 1, height = 1 }, border = 'none' },
  performance = {
    rtp = {
      -- netrw は oil.nvim が置き換える
      disabled_plugins = {
        'gzip', 'netrwPlugin', 'tarPlugin', 'tohtml', 'tutor', 'zipPlugin',
      },
    },
  },
})
