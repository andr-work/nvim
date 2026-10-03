-- 詰め合わせの mini.nvim ではなく、単体配布リポジトリを使う
return {
  'nvim-mini/mini.indentscope',
  branch = 'stable',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {},
  config = function(_, opts)
    require('mini.indentscope').setup(opts)

    -- プラグインが出すバッファでは線を引かない
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('conf-indentscope-disable', { clear = true }),
      pattern = { 'oil', 'lazy', 'mason', 'help', 'checkhealth', 'fzf', 'gitcommit' },
      callback = function() vim.b.miniindentscope_disable = true end,
    })
  end,
}
