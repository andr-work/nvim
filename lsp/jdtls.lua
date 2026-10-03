-- jdtls はプロジェクトごとに workspace を分ける必要がある
local function workspace_dir(root)
  local name = vim.fn.fnamemodify(root, ':p:h:t')
  return vim.fn.stdpath('cache') .. '/jdtls/' .. name .. '-' .. vim.fn.sha256(root):sub(1, 8)
end

-- mason 同梱の lombok.jar。ランチャは自動では渡さない
local lombok = vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar'

return {
  -- root ごとに -data を変えるため cmd を関数で組み立てる
  cmd = function(dispatchers, config)
    local root = config.root_dir or vim.uv.cwd()
    local cmd = { 'jdtls', '-data', workspace_dir(root) }
    -- Lombok が生成する getter/setter を認識させる
    if vim.uv.fs_stat(lombok) then
      table.insert(cmd, 2, '--jvm-arg=-javaagent:' .. lombok)
    end
    return vim.lsp.rpc.start(cmd, dispatchers)
  end,
  filetypes = { 'java' },
  root_markers = {
    { 'settings.gradle', 'settings.gradle.kts', 'pom.xml', 'build.gradle', 'build.gradle.kts' },
    { 'gradlew', 'mvnw' },
    '.git',
  },
  settings = {
    java = {
      -- ビルド定義が変わったら取り込むか都度聞く
      configuration = { updateBuildConfiguration = 'interactive' },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      import = {
        gradle = {
          -- MapStruct のプロセッサが Lombok 生成分を認識できず誤検知するため切る
          annotationProcessing = { enabled = false },
        },
      },
    },
  },
}
