return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  opts = {},
  init = function()
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { 'NeoTreeNormal', 'NeoTreeNormalNC', 'NormalFloat' })
    vim.g.transparent_enabled = true
  end,
}
