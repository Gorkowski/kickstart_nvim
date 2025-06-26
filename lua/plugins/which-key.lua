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
      -- 🧠 Add your Git mappings here
      { '<leader>g', group = '[G]it' },
      { '<leader>gg', '<cmd>Neogit<CR>', desc = 'Git Guide' },
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Diff View' },
      { '<leader>gs', '<cmd>lua require("neogit").actions.stage_all()<CR>', desc = 'Stage all' },
      { '<leader>gc', '<cmd>lua require("neogit").actions.commit.commit()<CR>', desc = 'Commit' },
      { '<leader>gr', '<cmd>lua require("neogit").actions.rebase.open_rebase_popup()<CR>', desc = 'Rebase' },
      { '<leader>gF', '<cmd>lua require("neogit").actions.push.force_with_lease()<CR>', desc = 'Force push w/ lease' },
      { '<leader>gu', '<cmd>lua require("neogit").actions.push.push_to_upstream()<CR>', desc = 'Push to upstream' },
      { '<leader>go', '<cmd>lua require("neogit").actions.push.push_to_origin()<CR>', desc = 'Push to origin' },
      { '<leader>gb', '<cmd>Telescope git_branches<CR>', desc = 'Checkout Branch' },
      {
        '<leader>gR',
        function()
          require('telescope.builtin').git_branches({
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
          })
        end,
        desc = 'Checkout Remote → Local with Tracking',
      },
    },
  },
}
