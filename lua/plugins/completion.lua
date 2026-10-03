return {
  'saghen/blink.cmp',
  -- fuzzy マッチャのプリビルド版を取るためタグ指定が必須
  version = '1.*',
  event = 'InsertEnter',
  opts = {
    keymap = {
      -- <CR> で確定、<Tab> はスニペット送りと候補移動を兼ねる
      preset = 'enter',
      ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      ghost_text = { enabled = true },
      menu = { border = 'rounded' },
    },
    signature = { enabled = true, window = { border = 'rounded' } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
