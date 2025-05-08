return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[C]ode [F]ormat',
    },
  },
  opts = {
    notify_on_server = false,
    format_on_save = function(bufnr)
      local disable_filetypes = {}
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      cmake = { 'cmake_format' },
      cs = { 'csharpier' },
      javascript = { 'dprint', stop_after_first = true },
      typescript = { 'dprint', stop_after_first = true },
      vue = { 'dprint', stop_after_first = true },
      json = { 'dprint', stop_after_first = true },
      rust = { 'rustfmt' },
      protobuf = { 'buf' },
      latex = { 'tex-fmt' },
      python = { 'black' },
    },
    formatters = {
      cmake_format = {
        args = { '-', '--config-files', vim.fn.stdpath 'config' .. '/plugin-config/cmake-format.yaml' },
      },
      csharpier = {
        command = 'csharpier',
        args = { 'format', '--write-stdout' },
        stdin = true,
      },
    },
  },
}
