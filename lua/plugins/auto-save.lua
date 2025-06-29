-- Auto-save files when only on certain file types
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
        -- only save if the buffer is modifiable and is python or markdown
        local bo = vim.bo[buf]
        local ft = bo.filetype
        if bo.modifiable and (ft == 'python' or ft == 'markdown') then
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
