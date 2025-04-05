return {
	"folke/zen-mode.nvim",
	config = function()
		local zen_mode = require("zen-mode")

		-- Function to configure Zen Mode
		local function setup_zen_mode(number, rnu)
			zen_mode.setup({
				window = {
					width = 1000,
					options = {},
				},
			})
			zen_mode.toggle()
			vim.wo.wrap = false
			vim.wo.number = number
			vim.wo.rnu = rnu
			vim.opt.colorcolumn = "0"
			ColorMyPencils()
		end

		-- Keymaps
		vim.keymap.set("n", "<leader>zz", function()
			setup_zen_mode(true, true)
		end)

		vim.keymap.set("n", "<leader>zZ", function()
			setup_zen_mode(false, false)
		end)

		-- ✅ Enable Zen Mode on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				setup_zen_mode(true, true) -- or false, false if you want a more minimal mode
			end,
		})
	end,
}
