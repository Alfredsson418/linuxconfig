-- lua/core/keymaps.lua

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- #### General keymaps ####
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
keymap("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all without saving" })
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- #### Text editing keymaps ####
-- Copy (yank) to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- Cut (delete) to system clipboard
keymap({ "n", "v" }, "<leader>d", '"+d', { desc = "Cut to clipboard" })
keymap("n", "<leader>D", '"+D', { desc = "Cut line to clipboard" })

-- Paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste after cursor from clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before cursor from clipboard" })

-- Select all
keymap("n", "<leader>a", "ggVG", { desc = "Select all text in buffer" })


-- #### Window management ####
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Window navigation with Ctrl + a/s/w/d
keymap("n", "<C-a>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<C-s>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<C-w>", "<C-w>k", { noremap = true, silent = true }) -- overrides default
keymap("n", "<C-d>", "<C-w>l", { noremap = true, silent = true })

-- #### Tab management ####
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })

-- #### Plugins ####
-- Telescope keymaps
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Find word under cursor" })

keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })

-- LSP pickers (these work once LSP is set up)
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })
keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP references" })
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
keymap("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })

-- Tree
keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })


-- Documentation and error messages
-- Show current function docs
keymap("n", "<leader><Tab>", vim.lsp.buf.hover, { desc = "Show docs", })

-- Display error on current line
keymap("n", "<leader>§", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostics for line" })

-- Display all errors in current file
keymap("n", "<leader>§§", vim.diagnostic.setloclist, { desc = "Show diagnostics list" })

keymap({ "n", "v" }, "<leader>cc", vim.lsp.buf.format, { desc = "Format File" })
