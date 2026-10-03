return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    -- 各キーの desc は keymap 側で付けているのでグループ名だけ定義する
    spec = {
      { '<leader>f', group = 'find' },
      { '<leader>c', group = 'code' },
    },
  },
  keys = {
    {
      '<leader>?',
      function() require('which-key').show({ global = false }) end,
      desc = 'Buffer local keymaps',
    },
  },
}
