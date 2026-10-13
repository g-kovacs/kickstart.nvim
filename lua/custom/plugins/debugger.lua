return {
  'mfussenegger/nvim-dap',

  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dapui.setup()
    require('nvim-dap-virtual-text').setup()

    -- Configure the cpptools adapter
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = vim.fn.expand '~/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }

    -- Open debugging panels automatically
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- VS Code-like debugging shortcuts
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start / Continue' })
    vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Debug: Toggle breakpoint' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Continue' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle breakpoint' })
    vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Debug: Step over (next)' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step into' })
    vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug: Step out' })
    vim.keymap.set('n', '<leader>dx', dap.terminate, { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI' })
    vim.keymap.set('n', '<leader>de', dapui.eval, { desc = 'Debug: Evaluate expression' })
    vim.keymap.set('n', '<leader>dr', function()
      dap.repl.open()
    end, { desc = 'Debug: Open REPL' })
  end,
}
