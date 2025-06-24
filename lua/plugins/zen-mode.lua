return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 80,
      options = {
        number = false,
        relativenumber = false,
      },
    },
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle Zen Mode' },
  },
}
