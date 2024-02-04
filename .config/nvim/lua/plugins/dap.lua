return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        -- "jay-babu/mason-nvim-dap.nvim",
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "mfussenegger/nvim-dap-python",
    },
    keys = {
        { '<F5>',      function() require 'telescope'.extensions.dap.configurations {} end },
        { '<F6>',      function() require("dap").step_over() end },
        { '<F7>',      function() require("dap").step_into() end },
        { '<F8>',      function() require("dap").step_out() end },
        { '<F9>',      "<cmd>DapTerminate<cr>" },
        { '<Leader>b', function() require("dap").toggle_breakpoint() end },
        { '<Leader>B', function() require("dap").set_breakpoint() end },
        { '<Leader>lp',
            function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
        { '<leader>fb', function() require 'telescope'.extensions.dap.list_breakpoints {} end },
        { '<Leader>dr', function() require("dap").repl.open() end },
        { '<Leader>dl', function() require("dap").run_last() end },
        {
            '<Leader>dh',
            function()
                require('dap.ui.widgets').hover()
            end,
            mode = { 'n', 'v' }
        },
        {
            '<Leader>dp',
            function()
                require('dap.ui.widgets').preview()
            end,
            mode = { 'n', 'v' }
        },
        { '<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end },
        { '<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end },
    },
    config = function()
        -- local daps = {
        --     "python"
        -- }
        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapUIStop', linehl = '', numhl = '', culhl = '' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapUIPlayPause', linehl = '', numhl = '', culhl = '' })
        -- require('mason-nvim-dap').setup({
        --     ensure_installed = daps,
        --     automatic_installation = true,
        --     handlers = {},
        -- })
        require("nvim-dap-virtual-text").setup({})
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}
