local function set_git_user()
	local user = vim.fn.system("git config get user.name 2> /dev/null | tr -d '\n'")
	if user ~= "" then
		vim.b.git_user = " " .. user
	else
		vim.b.git_user = ""
	end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		set_git_user()
	end,
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = " ", right = " " },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 1,
				symbols = {
					modified = "󱇧",
					readonly = "󰈡",
					newfile = "",
				},
			},
			"location",
			"diff",
			"diagnostics",
		},
		lualine_c = {
			"harpoon2",
		},
		lualine_x = {
			require("opencode").statusline,
		},
		lualine_y = {
			"filetype",
			function()
				if os.getenv("VIRTUAL_ENV_PROMPT") then
					return " " .. os.getenv("VIRTUAL_ENV_PROMPT")
				end
				return ""
			end,
			function()
				return vim.b.git_user
			end,
		},
		lualine_z = {
			"branch",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
