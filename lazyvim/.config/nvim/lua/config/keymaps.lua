-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>td", function()
  Util.terminal({ "lazydocker" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazydocker (root dir)" })