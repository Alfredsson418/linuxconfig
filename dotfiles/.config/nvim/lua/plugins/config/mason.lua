return
{
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = { { "mason-org/mason.nvim", opts = {} } },
		opts = require("plugins.mason_installer"),
	},
}
