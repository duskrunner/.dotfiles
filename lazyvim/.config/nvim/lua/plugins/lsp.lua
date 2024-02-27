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

local function swap_key_value(t)
  local swapped = {}
  for linter, fts in pairs(t) do
    for _, ft in ipairs(fts) do
      swapped[ft] = swapped[ft] or {}
      vim.list_extend(swapped[ft], { linter })
    end
  end
  return swapped
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local ensure_installed = {
        -- Python
        "ruff-lsp", -- lsp
        "ruff", -- linter
        "pyright", -- lsp
        "black", -- formatter
        "mypy", -- typechecker

        -- Arduino
        "arduino-language-server",

        --js/ts
        "prettierd", --formatter
        "eslint_d", --linter

        -- C
        "clang-format",
      }

      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, ensure_installed)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- get default config

      local MY_FQBN = "arduino:avr:uno"
      local arduino_default_config = require("lspconfig").arduino_language_server.document_config.default_config
      arduino_default_config.cmd = {
        "arduino-language-server",
        "-cli-config",
        "~/.arduino15/arduino-cli.yaml",
        "-fqbn",
        MY_FQBN,
      }

      opts.servers.arduino_language_server = arduino_default_config
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

      local ft_by_formatter = {
        ruff_fix = { "python" },
        ruff_format = { "python" },
        prettierd = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        clang_format = { "arduino" },
      }

      local extend_formatters_with = swap_key_value(ft_by_formatter)
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

      local linter_to_fts = {
        mypy = { "python" },
        eslint_d = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      }

      local linters_by_ft = swap_key_value(linter_to_fts)

      for ft, linters_ in pairs(linters_by_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        vim.list_extend(opts.linters_by_ft[ft], linters_)
      end
    end,
  },
}
