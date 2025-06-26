-- GitHub Copilot integration
return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      script = true,
      noremap = true,
    })
  end,
}
