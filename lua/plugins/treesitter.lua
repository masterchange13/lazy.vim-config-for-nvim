-- ~/.config/nvim/lua/plugins/treesitter.lua

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "bash",
    "python",
    "json",
    "yaml",
    "html",
    "css",
    "javascript",
    "typescript",
    "cpp",
    "java",
    "rust"
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})

