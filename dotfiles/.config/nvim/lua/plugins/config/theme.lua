return {
  "edeneast/nightfox.nvim",
  lazy = false,  -- load immediately
  priority = 1000, -- load before other plugins
  config = function()
    vim.cmd.colorscheme("carbonfox")
  end,
}
