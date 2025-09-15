return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        layout_config = { horizontal = { preview_width = 0.55 } },
        file_ignore_patterns = { },
      },
	pickers = { 
		find_files = { hidden = true }
		},
    })
  end,
}

