return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  dependencies = {
    { 'MunifTanjim/nui.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>fe',
      function()
        require('neo-tree.command').execute { toggle = true }
      end,
      desc = 'Explorer NeoTree (root dir)',
    },
    { '<leader>e', '<leader>fe', desc = 'Explorer NeoTree (root dir)', remap = true },
    { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
    {
      '<leader>ge',
      function()
        require('neo-tree.command').execute { source = 'git_status', toggle = true }
      end,
      desc = 'Git explorer',
    },
    {
      '<leader>be',
      function()
        require('neo-tree.command').execute { source = 'buffers', toggle = true }
      end,
      desc = 'Buffer explorer',
    },
  },
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require 'neo-tree'
      end
    end
  end,
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      mappings = {
        ['<space>'] = 'none',
        ['Y'] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg('+', path, 'c')
        end,
      },
    },
  },
  config = function(_, opts)
    opts.event_handlers = opts.event_handlers or {}
    require('neo-tree').setup(opts)
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*lazygit',
      callback = function()
        if package.loaded['neo-tree.sources.git_status'] then
          require('neo-tree.sources.git_status').refresh()
        end
      end,
    })
  end,
}
