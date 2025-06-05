vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.relativenumber = true

-- Close all buffers and exit Neovim
vim.keymap.set("n", "<leader>aa", function()
    vim.cmd("wall")       -- write all
    vim.cmd("bufdo bd")   -- close all buffers
    vim.cmd("qa")         -- quit Neovim
end, { desc = "Close all buffers and quit" })

vim.keymap.set("n", "<leader>af", function()
    local current = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
            vim.cmd("bd! " .. buf)
        end
    end
end, { desc = "Close other buffers" })

