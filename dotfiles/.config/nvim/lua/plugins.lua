vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Setup lazy with plugins
require("lazy").setup({
  -- Example plugins
  "nvim-lua/plenary.nvim", -- dependency library
  "nvim-treesitter/nvim-treesitter", -- syntax highlighting
  "neovim/nvim-lspconfig", -- language server support
  {
    "nvim-telescope/telescope.nvim", -- fuzzy finder
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})

