return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    'andrew-george/telescope-themes',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        themes = {
          persist = {
            enabled = true,
            path = vim.fn.stdpath 'config' .. '/lua/config/current-colorscheme.lua',
          },
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'themes')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>saf', function()
      builtin.find_files { hidden = true, no_ignore = true }
    end, { desc = '[S]earch [A]ll [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    -- TODO: Find out difference between grep_string and live_grep
    vim.keymap.set('n', '<leader>saw', function()
      builtin.grep_string { additional_args = { '--hidden' } }
    end, { desc = '[S]earch [A]ll current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sag', function()
      builtin.live_grep { additional_args = { '--hidden' } }
    end, { desc = '[S]earch [A]ll by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s"', builtin.registers, { desc = '[S]earch ["]Registers' })
    vim.keymap.set('n', '<leader>scs', ':Telescope themes<CR>', { noremap = true, silent = true, desc = '[S]earch [C]olor[S]chemes' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>snf', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config', hidden = true, no_ignore = true, follow = true }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
