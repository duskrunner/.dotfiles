return {

  'mxsdev/nvim-dap-vscode-js',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('dap-vscode-js').setup {
      debugger_path = vim.fn.resolve(vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug'),
      adapters = {
        'chrome',
        'pwa-node',
        'pwa-chrome',
        'pwa-msedge',
        'pwa-extensionHost',
        'node-terminal',
      },
    }
  end,
}
