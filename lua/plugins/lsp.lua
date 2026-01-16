-- mason 本身（不变）
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig 只负责“安装”
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
  },
})

-- cmp 能力（保留）
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Neovim 0.11+ 官方 LSP 配置方式
vim.lsp.config.lua_ls = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- 启用 LSP
vim.lsp.enable({ "lua_ls" })

