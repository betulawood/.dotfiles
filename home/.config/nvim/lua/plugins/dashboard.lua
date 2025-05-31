return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			config = {
				header = {
					[[                               __                ]],
					[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
					[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
					[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
					[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
					[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
