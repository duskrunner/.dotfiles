local function prefer_bin_from_venv(executable_name)
  -- Return the path to the executable if $VIRTUAL_ENV is set and the binary exists somewhere beneath the $VIRTUAL_ENV path, otherwise get it from Mason
  if vim.env.VIRTUAL_ENV then
    local paths = vim.fn.glob(vim.env.VIRTUAL_ENV .. "/**/bin/" .. executable_name, true, true)
    local executable_path = table.concat(paths, ", ")
    if executable_path ~= "" then
      return executable_path
    end
  end

  local mason_registry = require("mason-registry")
  local mason_path = mason_registry.get_package(executable_name):get_install_path() .. "/venv/bin/" .. executable_name
  return mason_path
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local ensure_installed = {
        -- python
        "ruff-lsp", -- lsp
        "ruff", -- linter
        "pyright", -- lsp
        "black", -- formatter
        "mypy", -- typechecker
      }

      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, ensure_installed)
    end,
  },
  {
    "stevearc/conform.nvim",
    enabled = true,
    opts = function(_, opts)
      local formatters = require("conform.formatters")
      formatters.ruff_fix.command = prefer_bin_from_venv("ruff")
      formatters.ruff_format.command = prefer_bin_from_venv("ruff")
      formatters.isort.command = prefer_bin_from_venv("isort")
      formatters.black.command = prefer_bin_from_venv("black")
      formatters.stylua.args =
        vim.list_extend({ "--indent-type", "Spaces", "--indent-width", "2" }, formatters.stylua.args)

      local extend_formatters_with = {
        python = { "ruff_fix", "ruff_format" },
      }
      local replace_formatters_with = {}

      for ft, formatters_ in pairs(extend_formatters_with) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        vim.list_extend(opts.formatters_by_ft[ft], formatters_)
      end
      for ft, formatters_ in pairs(replace_formatters_with) do
        opts.formatters_by_ft[ft] = formatters_
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    enabled = true,
    opts = function(_, opts)
      local linters = require("lint").linters

      linters.mypy.cmd = prefer_bin_from_venv("mypy")
      linters.mypy.args = vim.list_extend({ "--check-untyped-defs" }, linters.mypy.args)

      local linters_by_ft = {
        python = { "mypy" },
      }

      for ft, linters_ in pairs(linters_by_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        vim.list_extend(opts.linters_by_ft[ft], linters_)
      end
    end,
  },
}
