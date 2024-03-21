local M = {}
M.prefer_bin_from_venv = function(executable_name)
  -- Return the path to the executable if $VIRTUAL_ENV is set and the binary exists somewhere beneath the $VIRTUAL_ENV path, otherwise get it from Mason
  if vim.env.VIRTUAL_ENV then
    local paths = vim.fn.glob(vim.env.VIRTUAL_ENV .. '/**/bin/' .. executable_name, true, true)
    local executable_path = table.concat(paths, ', ')
    if executable_path ~= '' then
      return executable_path
    end
  end

  local mason_registry = require 'mason-registry'
  local mason_path = mason_registry.get_package(executable_name):get_install_path() .. '/venv/bin/' .. executable_name
  return mason_path
end

M.map = function(mode, lhs, rhs, opts)
  local keys = require('lazy.core.handler').handlers.keys
  ---@cast keys LazyKeysHandler
  local modes = type(mode) == 'string' and { mode } or mode
  ---@param m string
  modes = vim.tbl_filter(function(m)
    return not (keys.have and keys:have(lhs, m))
  end, modes)

  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

return M
