return {
  'mason-org/mason.nvim',
  -- mason が PATH の先頭に bin を足すので、LSP 起動より前に読む
  lazy = false,
  priority = 100,
  -- 枠ありだと画面幅を超えるので none にする
  opts = { ui = { width = 1, height = 1, border = 'none' } },
  config = function(_, opts)
    require('mason').setup(opts)

    -- 設定本体は ~/.config/nvim/lsp/<名前>.lua
    vim.lsp.enable({ 'jdtls', 'pyright' })

    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      float = { border = 'rounded', source = true },
    })
  end,
}
