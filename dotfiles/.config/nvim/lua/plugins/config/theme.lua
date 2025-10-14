return {
	"edeneast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
				terminal_colors = true,
			}
		})
		vim.cmd("colorscheme carbonfox")
	end,
}
