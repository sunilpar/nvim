return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("sunil_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = ThePrimeagen_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, opts)

				-- rebase always
				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
			end,
		})

		-- git add . commit and push (leader+gpp)
		vim.keymap.set("n", "<leader>gpp", function()
			-- Stage all changes (git add .)
			vim.cmd("Git add .")

			-- Prompt user for a commit message
			vim.ui.input({ prompt = "Commit message: " }, function(input)
				if input then
					-- Commit with the user input message (git commit)
					vim.cmd("Git commit -m '" .. input .. "'")

					-- Push to origin main (git push origin main)
					vim.cmd("Git push origin main")
				else
					print("Commit message is required.")
				end
			end)
		end)

		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
	end,
}
