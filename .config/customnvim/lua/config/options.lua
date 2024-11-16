vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true
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

vim.o.mouse = "a"
vim.o.autoindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.termguicolors = true

vim.o.swapfile = false
vim.o.backup = false

vim.o.smartindent = true

vim.o.backspace = "indent,eol,start"
vim.wo.signcolumn = "yes"

vim.o.fileencoding = "utf-8"
vim.o.showmode = false
vim.o.showtabline = 2
