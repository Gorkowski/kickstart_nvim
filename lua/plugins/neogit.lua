-- Neogit integration
return {
  'TimUntersberger/neogit',
  lazy = false,
  cmd = 'Neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neogit').setup {
      disable_signs = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = true,
      auto_refresh = true,
      kind = 'tab',
    }
  end,
}
