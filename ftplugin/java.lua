local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local mason_jdtls = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
local cmd = vim.fn.executable(mason_jdtls) == 1 and mason_jdtls or "jdtls"

if vim.fn.executable(cmd) ~= 1 then
  vim.notify("jdtls not found; install it with :MasonInstall jdtls", vim.log.levels.WARN)
  return
end

local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
if not root_dir then
  return
end

-- One workspace per project, kept in the cache dir so it never lands in a repo
local workspace = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

jdtls.start_or_attach({
  cmd = { cmd, "-data", workspace },
  root_dir = root_dir,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
