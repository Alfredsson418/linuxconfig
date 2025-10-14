-- Tabs & indentation
vim.opt.tabstop = 4        -- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4     -- number of spaces to use for autoindent
-- vim.opt.expandtab = true  -- convert <Tab> keypress into spaces
vim.opt.smartindent = true -- smart autoindenting

vim.opt.number = true
-- vim.opt.relativenumber = true

-- Yanks everyting to clipboard
vim.cmd("set clipboard=unnamedplus")
