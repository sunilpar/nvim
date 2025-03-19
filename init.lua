-- Take control of my leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap using lazy.nvim package manager.
require("traap.config.bootstrap")

-- Personalize Lazy.nvim and Lazy.vim
require("traap.config.lazy")

-- greatest remap ever by (primeagen)
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- mine
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Switch to Normal Mode' })

-- Apply my customizations.
vim.cmd.colorscheme(require("traap.config.colorscheme").name)
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.core.clipboard")

require("traap.core.working").whosePlugins()
