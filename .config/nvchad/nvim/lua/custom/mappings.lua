local M = {}

M.editor = {
  n = {
    ["<leader>q"] = { "<cmd>:qa<CR>", "Quit Editor" },
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "Open Aerial" },
    ["<leader>tt"] = { "<cmd>TroubleToggle<CR>", "Toggle Trouble"},
  },
}

return M
