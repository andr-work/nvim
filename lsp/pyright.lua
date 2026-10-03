-- 有効化済み venv > プロジェクト内の .venv > PATH の python3 の順で解決する
local function find_python(root)
  if vim.env.VIRTUAL_ENV then return vim.env.VIRTUAL_ENV .. '/bin/python' end
  -- root 直下と 1 階層下まで探す
  for _, pat in ipairs({ root .. '/.venv/bin/python', root .. '/*/.venv/bin/python' }) do
    local hit = vim.fn.glob(pat, false, true)[1]
    if hit ~= nil then return hit end
  end
  return vim.fn.exepath('python3')
end

return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json' },
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
  before_init = function(_, config)
    config.settings.python.pythonPath = find_python(config.root_dir or vim.uv.cwd())
  end,
}
