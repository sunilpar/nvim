function ColorMyPencils(color)
	color = color or "tokyonight"
	-- color = color or "vscode"
	--	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

	{
		"erikbackman/brightburn.vim",
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
			})
			ColorMyPencils()
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, flavour = "mocha" },

	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup({
				transparent = true,
				italic_comments = false,
			})
			ColorMyPencils()
		end,
	},
}
