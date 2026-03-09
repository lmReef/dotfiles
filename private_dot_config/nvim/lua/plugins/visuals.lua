return {
	"nvim-lualine/lualine.nvim",
	"letieu/harpoon-lualine",

	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			color_icons = true,
			default = true,
			strict = true,
		},
		lazy = true,
	},

	-- themes

	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					"pywal",
					"onedark",
					"rose-pine",
					"dracula",
					"catppuccin",
					"molokai",
					"kanagawa",
					"nightfox",
					"tokyodark",
					"tokyonight",
					"gruvbox",
					"vague",
					"0x96f",
				},
				livePreview = true,
			})
		end,
	},

	{ "AlphaTechnolog/pywal.nvim", name = "pywal" },

	{ "navarasu/onedark.nvim", name = "onedark" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "maxmx03/dracula.nvim", name = "dracula" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "tomasr/molokai", name = "molokai" },
	{ "rebelot/kanagawa.nvim", name = "kanagawa" },
	{ "edeneast/nightfox.nvim", name = "nightfox" },
	{ "tiagovla/tokyodark.nvim", name = "tokyodark" },
	{ "folke/tokyonight.nvim", name = "tokyonight" },
	{ "morhetz/gruvbox", name = "gruvbox" },
	{ "vague2k/vague.nvim", name = "vague" },
	{
		"filipjanevski/0x96f.nvim",
		name = "0x96f",
	},
}
