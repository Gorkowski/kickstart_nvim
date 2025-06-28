-- Auto-save files when leaving insert mode or text changes
return {
  'Pocco81/auto-save.nvim',
  event = { 'InsertLeave', 'TextChangedI' },
  config = function()
    require('auto-save').setup {
      enabled = true,
      execution_message = {
        message = function()
          return 'AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S'
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { 'InsertLeave', 'TextChangedI' },
      condition = function(buf)
        local fn = vim.fn
        local utils = require 'auto-save.utils.data'
        local modifiable = fn.getbufvar(buf, '&modifiable') == 1
        local ft = fn.getbufvar(buf, '&filetype')
        local bt = fn.getbufvar(buf, '&buftype')
        local ignored_filetypes = { 'harpoon', 'alpha', 'dashboard' }
        local ignored_buftypes = { 'nofile', 'prompt', 'help', 'terminal' }
        if modifiable and utils.not_in(ft, ignored_filetypes) and utils.not_in(bt, ignored_buftypes) then
          return true
        end
        return false
      end,
      write_all_buffers = false,
      debounce_delay = 135,
      callbacks = {
        enabling = nil,
        disabling = nil,
        before_asserting_save = nil,
        before_saving = nil,
        after_saving = nil,
      },
    }
  end,
}
