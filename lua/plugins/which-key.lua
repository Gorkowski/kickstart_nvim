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
      { '<leader>gg', '<cmd>Neogit<CR>', desc = '[g]uide' },
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Diff View' },
      { '<leader>gc', '<cmd>Neogit commit<CR>', desc = '[c]ommit Changes' },
      { '<leader>gr', '<cmd>Neogit rebase<CR>', desc = '[r]ebase' },
      { '<leader>gs', '<cmd>Neogit reset<CR>', desc = 're[s]et' },
      { '<leader>gF', '<cmd>Neogit push --force-with-lease<CR>', desc = '[F]orce push w/ lease' },
      { '<leader>gp', '<cmd>Neogit push<CR>', desc = '[p]ush' },
      { '<leader>gP', '<cmd>Neogit pull<CR>', desc = '[P]ULL' },
      { -- 📂 Git switch branch for both local and remote branches
        '<leader>gb',
        function()
          local builtin = require 'telescope.builtin'
          local actions = require 'telescope.actions'
          local action_state = require 'telescope.actions.state'

          builtin.git_branches {
            prompt_title = '[b]ranch Checkout',
            show_remote = true,
            attach_mappings = function(prompt_bufnr, map)
              local function checkout()
                local entry = action_state.get_selected_entry()
                local branch = entry.value
                actions.close(prompt_bufnr)

                if branch:find '/' then
                  -- remote branch: e.g. "origin/feature-x"
                  vim.cmd('!git switch --track ' .. branch)
                else
                  -- local branch: e.g. "main"
                  vim.cmd('!git switch ' .. branch)
                end
              end

              map('i', '<CR>', checkout)
              map('n', '<CR>', checkout)
              return true
            end,
          }
        end,
        desc = '[b]ranch Checkout',
      },
      {
        '<leader>gh',
        function()
          -- get short hash, strip newline
          local h = vim.fn.system('git rev-parse HEAD'):gsub('%s+', '')
          -- copy to system clipboard
          vim.fn.setreg('+', h)
          -- feedback
          vim.notify('Copied Git hash: ' .. h, vim.log.levels.INFO)
        end,
        desc = '[h]ash copy',
      },

      -- 📋 Copy file path mappings
      { '<leader>p', group = '[p]ath copy' },
      {
        '<leader>pf',
        function()
          local file = vim.fn.expand '%:t'
          vim.fn.setreg('+', file)
          print('Copied file name: ' .. file)
        end,
        desc = '[f]ile Name',
      },
      {
        '<leader>pr',
        function()
          local rel = vim.fn.expand '%'
          vim.fn.setreg('+', rel)
          print('Copied relative path: ' .. rel)
        end,
        desc = '[r]elative path',
      },
      {
        '<leader>pd',
        function()
          local dir = vim.fn.expand '%:p:h'
          vim.fn.setreg('+', dir)
          print('Copied directory path: ' .. dir)
        end,
        desc = '[d]irectory path',
      },
      {
        '<leader>pp',
        function()
          local path = vim.fn.expand '%:p'
          vim.fn.setreg('+', path)
          print('Copied full path: ' .. path)
        end,
        desc = '[p]ath',
      },
    },
  },
}
