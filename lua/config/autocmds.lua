-- Basic autocommands

-- Show a ruler at column 79 for Python files
vim.api.nvim_create_augroup('python_ruler', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'python_ruler',
  pattern = 'python',
  callback = function()
    vim.opt_local.colorcolumn = '79'
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

return {}
