local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts)

--- Quit Neovim
vim.keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Exit Neovim" })

--- Display Lazy
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { silent = true, desc = "Show Lazy" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- keep last yank when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Buffer mappings - (Close others, Close current, previous tab, next tab)
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":<C-U>bprevious <bar> bdelete #<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- diagnostics keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "goto previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "open diagnostic" })
vim.keymap.set("n", "<leader>x", vim.diagnostic.setloclist, { desc = "show all diagnostics" })
