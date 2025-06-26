-- Show possible keybindings
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      -- 🧠 Updated Git mappings using Neogit CLI-style commands

      { '<leader>g', group = '[G]it' },
      { '<leader>gg', '<cmd>Neogit<CR>', desc = 'Git Guide' },
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Diff View' },
      { '<leader>gs', '<cmd>Neogit stage<CR>', desc = 'Stage All' },
      { '<leader>gc', '<cmd>Neogit commit<CR>', desc = 'Commit Changes' },
      { '<leader>gr', '<cmd>Neogit rebase<CR>', desc = 'Rebase' },
      { '<leader>gF', '<cmd>Neogit push --force-with-lease<CR>', desc = 'Force push w/ lease' },
      { '<leader>gu', '<cmd>Neogit push<CR>', desc = 'Push to upstream' },
      { '<leader>go', '<cmd>Neogit push<CR>', desc = 'Push to origin' },
      { '<leader>gb', '<cmd>Telescope git_branches<CR>', desc = 'Checkout Branch' },

      {
        '<leader>gR',
        function()
          require('telescope.builtin').git_branches {
            prompt_title = 'Checkout Remote Branch',
            remote = true,
            attach_mappings = function(_, map)
              map('i', '<CR>', function(prompt_bufnr)
                local entry = require('telescope.actions.state').get_selected_entry()
                local branch = entry.value:gsub('^origin/', '')
                require('telescope.actions').close(prompt_bufnr)
                vim.cmd('Git switch -c ' .. branch .. ' --track origin/' .. branch)
              end)
              return true
            end,
          }
        end,
        desc = 'Checkout Remote → Local with Tracking',
      },
    },
  },
}
