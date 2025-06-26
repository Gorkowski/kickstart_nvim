-- Distraction free coding
return {
  'folke/zen-mode.nvim',
  keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle Zen Mode' } },
  opts = {
    window = {
      width = 120,
      options = { number = true, relativenumber = false },
    },
    on_open = function()
      vim.cmd [[
        command! -buffer Q lua require("zen-mode").toggle(); vim.cmd("q")
        cabbrev  <buffer> q Q
      ]]
    end,
    on_close = function()
      vim.cmd [[delcommand Q]]
    end,
  },
}
