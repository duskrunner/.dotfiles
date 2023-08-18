---@type ChadrcConfig
local M = {}
M.ui = { theme = "chadracula" }
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
return M
