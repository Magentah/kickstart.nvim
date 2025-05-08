return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    opts = {
      sections = {
        lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp', 'nvim_diagnostic' } } },
        lualine_c = { { 'filename', path = 1 }, 'lsp_progress' },
      },
      winbar = {
        lualine_a = { { 'buffers', mode = 4 } },
      },
      extensions = {
        'quickfix',
        'lazy',
        'mason',
        'nvim-tree',
        'trouble',
      },
    },
  },
}
