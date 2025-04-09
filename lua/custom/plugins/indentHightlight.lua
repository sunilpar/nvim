return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = {
				show_start = false,
				highlight = { "IblScope" },
			},
		})

		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3b4d", nocombine = true })
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#5a5a6e", nocombine = true })
	end,
}
