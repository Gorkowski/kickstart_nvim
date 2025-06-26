-- Options set for Neovim
-- See `:help vim.o`

-- Make line numbers default
vim.o.number = true
-- vim.o.relativenumber = true -- Enable relative numbers if you like

-- Enable mouse mode
vim.o.mouse = 'a'

-- Hide the mode since it's shown in the statusline
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
--  Schedule after `UiEnter` so startup isn't delayed
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching unless \C or capitals in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Display certain whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.o.inccommand = 'split'

-- Highlight current line
vim.o.cursorline = true

-- Keep some context lines above/below the cursor
vim.o.scrolloff = 10

-- Ask to save on quit instead of failing
vim.o.confirm = true

return {}
