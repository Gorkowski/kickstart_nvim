return {
  'stevearc/oil.nvim',
  lazy = false,
  cmd = { 'Oil', 'OilOpen', 'OilEdit', 'OilDelete', 'OilRename' },

  opts = {},
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
}
