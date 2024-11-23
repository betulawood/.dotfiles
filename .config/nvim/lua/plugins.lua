-- Auto-install Packer if not already installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Load plugins
return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "python", "rust", "go" }, -- Install parsers
                highlight = { enable = true },                -- Enable highlighting
                indent = { enable = true },                   -- Enable indentation
            }
        end
    }
    -- Autocompletion framework
    use 'hrsh7th/nvim-cmp'

    -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippet engine (required for autocompletion)
    use 'L3MON4D3/LuaSnip'

    -- Snippet source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'

    -- Other completion sources (optional)
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    
    -- Automatically manage LSP servers
    use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate' -- Ensure the latest registry is fetched
    }

    use 'williamboman/mason-lspconfig.nvim'

    -- Color
    use { "catppuccin/nvim",  
        config = function()
            -- Set the flavor (Optional: latte, frappe, macchiato, mocha)
            vim.g.catppuccin_flavour = "mocha" -- Change "mocha" as needed

            -- Load the theme
            require('catppuccin').setup()
            vim.cmd([[colorscheme catppuccin]])
        end}

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Automatically sync Packer after cloning it
    if packer_bootstrap then
        require('packer').sync()
    end
end)

