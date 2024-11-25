return {
    'comfysage/evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
        transparent_background = true,
        contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
        overrides = { }, -- add custom overrides
    },
    config = function(_, opts)
        require('evergarden').setup(opts) -- Apply the configuration
        vim.cmd.colorscheme('evergarden') -- Set the colorscheme
    end,
}
