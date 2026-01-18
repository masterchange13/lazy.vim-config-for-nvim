-- lua/plugins.lua

-- 1. 自动安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. 插件列表
require("lazy").setup({

  -- 🎨 主题
  { "scottmckendry/cyberdream.nvim" },

  -- 📊 状态栏
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- 🌲 文件树
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- tmux 窗口跳转
  { "christoomey/vim-tmux-navigator" },

  -- 🌈 Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- 🧱 LSP
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
  },

  -- 🤖 自动补全
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- 💬 注释
  { "numToStr/Comment.nvim", opts = {} },

  -- 🔧 括号自动补全
  { "windwp/nvim-autopairs", opts = {} },

  -- 📑 buffer 栏
  { "akinsho/bufferline.nvim" },

  -- 🌱 Git 提示
  { "lewis6991/gitsigns.nvim" },

  -- 🔍 Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- leetcode
  {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        -- include a picker of your choice, see picker section for more details
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- configuration goes here
        ---@type string
      arg = "leetcode.nvim",

      ---@type lc.lang
      lang = "cpp",

      cn = { -- leetcode.cn
          enabled = true, ---@type boolean
          translator = true, ---@type boolean
          translate_problems = true, ---@type boolean
      },

      ---@type lc.storage
      storage = {
          home = vim.fn.stdpath("data") .. "/leetcode",
          cache = vim.fn.stdpath("cache") .. "/leetcode",
      },
    },
  },

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
     -- add any options here
    },
    dependencies = {
       -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },

})

