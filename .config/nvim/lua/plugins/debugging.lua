return {
    "mfussenegger/nvim-dap",
    dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go" },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup({})
        require("dap-go").setup()

        dap.listeners.after.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.after.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.after.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.after.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    end,
}
