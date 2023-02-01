vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.mouse = "" -- "a" if you want to allow the mouse to be used in neovim
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

vim.opt.swapfile = false -- creates a swapfile
vim.opt.backup = false -- creates a backup file
vim.opt.writebackup = false -- if a file is being edited by another program, it is not allowed to be edited

vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation

vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.ruler = false -- hide the line and column number of the cursor position

vim.opt.wrap = false -- display lines as one long line

vim.opt.smartindent = true -- make indenting smarter again

vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300 -- faster completion (4000ms default)

vim.opt.undofile = true -- enable persistent undo

