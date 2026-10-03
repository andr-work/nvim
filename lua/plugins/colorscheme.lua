-- Ghostty の theme = tokyonight moon に合わせる
return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'moon',
    -- 背景はターミナル側を見せる
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme('tokyonight-moon')
  end,
}
