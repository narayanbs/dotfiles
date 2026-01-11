vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.autoindent = false
vim.o.smartindent = false

vim.o.number = true
vim.o.relativenumber = false
vim.o.cursorline = true
vim.o.ruler = false
vim.o.statuscolumn = [[%!v:lua.require'utils.ui'.statuscolumn()]]

vim.o.clipboard = "unnamedplus"

-- Not display ~ for blank lines
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 

vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.termguicolors = true
-- for sonokai 
-- vim.opt.termguicolors = false

vim.o.swapfile = false
vim.o.backup = false

vim.o.smartindent = true

vim.o.backspace = "indent,eol,start"
vim.wo.signcolumn = "yes"

vim.o.fileencoding = "utf-8"
vim.o.showmode = false
vim.o.showtabline = 2

vim.opt.completeopt = { "menuone", "noselect", "popup" } 
vim.opt.confirm=true

vim.opt.undofile=true

