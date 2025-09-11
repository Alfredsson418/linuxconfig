-- ~/.cnfig/nvim/lua/plugins/init.lua

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Example plugins
  { "nvim-lua/plenary.nvim" }, -- dependency for many plugins

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  { "nvim-telescope/telescope.nvim", branch = "0.1.x" },

  -- { "neovim/nvim-lspconfig" }, -- core LSP
  -- { "williamboman/mason.nvim" }, -- LSP/DAP installer
  -- { "williamboman/mason-lspconfig.nvim" },

  { "hrsh7th/nvim-cmp" },       -- autocompletion engine
  -- { "hrsh7th/cmp-nvim-lsp" },   -- LSP completion source
  -- { "L3MON4D3/LuaSnip" },       -- snippet engine

  -- { "nvim-lualine/lualine.nvim" }, -- statusline
  { "nvim-tree/nvim-tree.lua" },   -- file explorer

  -- Load plugin configs from separate files
  { import = "plugins.config" }, -- assumes you keep configs in lua/plugins/config/*.lua
})

