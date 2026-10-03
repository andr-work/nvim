# nvim

Neovim の個人設定。asakamak の設定を元にしている。

## 必要なもの

| | 用途 |
|---|---|
| Neovim 0.12 以上 | `vim.lsp.enable` / `winborder` を使う |
| git | lazy.nvim がプラグイン取得に使う |
| C コンパイラ | treesitter パーサのビルド |
| fzf / ripgrep / fd | fzf-lua |
| Nerd Font | アイコン表示 |
| trash | oil のゴミ箱削除（macOS は標準で入っている） |

## セットアップ

```sh
git clone git@github.com:andr-work/nvim.git ~/.config/nvim
nvim
```

初回起動で lazy.nvim が自分をブートストラップし、プラグインと treesitter パーサを取得する。
LSP サーバ本体は `:Mason` から入れる（現状 jdtls / pyright）。

## 構成

```
init.lua                 leader → options → lazy → keymaps → autocmds
lazy-lock.json           プラグインのリビジョン固定
lsp/<名前>.lua           LSP ごとの設定。vim.lsp.enable() が拾う
lua/config/
  lazy.lua               lazy.nvim のブートストラップ
  options.lua            オプション
  keymaps.lua            プラグインに属さないキーマップ
  autocmds.lua           LspAttach ほか
lua/plugins/<役割>.lua   1 ファイル 1 役割
```

プラグイン固有のキーマップは各 spec の `keys` に置いて遅延ロードさせ、それ以外だけ `config/keymaps.lua` に書く。

## プラグイン

| | 役割 |
|---|---|
| lazy.nvim | プラグイン管理 |
| tokyonight.nvim | 配色（moon、背景は透過してターミナル側を見せる） |
| oil.nvim | ファイラ。バッファとして編集でき、netrw を置き換える |
| fzf-lua | ファイル・grep・LSP シンボルの検索 |
| blink.cmp | 補完（fuzzy / signature help / スニペット） |
| gitsigns.nvim | 差分サインと hunk 移動 |
| lualine.nvim | ステータスライン |
| which-key.nvim | キーマップのヒント表示 |
| nvim-treesitter | 構文ハイライトと折りたたみ |
| mini.indentscope | 現在スコープのインデント線 |
| mason.nvim | LSP サーバのインストール |
| nvim-web-devicons | アイコン |

## キーマップ

leader は `Space`。

### 検索

| | |
|---|---|
| `<leader>ff` | ファイル |
| `<leader>fg` | grep |
| `<leader>fb` | バッファ |
| `<leader>fr` | 最近使ったファイル |
| `<leader>fd` | 診断 |
| `<leader>fk` | キーマップ |
| `<leader>fc` | 変更のあるファイル |
| `<leader>fh` | ヘルプ |
| `<leader>f.` | 直前の検索を再開 |

### ファイル

| | |
|---|---|
| `<leader>e` | カレントファイルの階層を開く／閉じる |
| `<leader>E` | cwd を開く |
| `-` | 親ディレクトリ |

oil のバッファは普通のテキストとして編集できる。行を書き換えれば rename、`dd` で削除、`p` でコピー。`:w` で確定する。

### Git

| | |
|---|---|
| `]c` / `[c` | 次／前の hunk |

変更行は signcolumn にマークが出る（追加・変更は `┃`、削除は `▁`）。ステージや blame は使わないのでキーマップを張っていない。

### LSP

| | | |
|---|---|---|
| `K` | ホバー | 組み込み |
| `grn` | リネーム | 組み込み |
| `gra` | コードアクション | 組み込み |
| `grr` | 参照 | 組み込み |
| `gri` | 実装 | 組み込み |
| `grt` | 型定義 | 組み込み |
| `gO` | ドキュメントシンボル | 組み込み |
| `gd` / `gD` | 定義／宣言 | fzf-lua |
| `<leader>fs` / `<leader>fS` | ドキュメント／ワークスペースのシンボル | fzf-lua |
| `<leader>cf` | フォーマット | — |

### その他

| | |
|---|---|
| `Alt-j` / `Alt-k` | 行・選択範囲の移動 |
| `Ctrl-h/j/k/l` | ウィンドウ移動 |
| `Esc` | 検索ハイライトを消す |
| `<leader>?` | バッファローカルのキーマップ一覧 |
