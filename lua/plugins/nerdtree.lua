-- File explorer
return {
  'preservim/nerdtree',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>n', '<cmd>NERDTreeToggle<CR>', desc = 'Toggle [n]ERDTree' },
    { '<leader>F', '<cmd>NERDTreeFind<CR>', desc = 'Find [F]ile in NERDTree' },
  },
  config = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeMinimalUI = 1
    vim.g.NERDTreeWinSize = 30
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        local wins = vim.api.nvim_tabpage_list_wins(0)
        if #wins == 2 then
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
            if ft == 'nerdtree' and vim.bo.filetype ~= 'nerdtree' then
              vim.cmd 'NERDTreeClose'
              break
            end
          end
        end
      end,
    })
  end,
}
