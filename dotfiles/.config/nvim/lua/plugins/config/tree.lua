return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = { width = 40 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
    })
    end,
}

