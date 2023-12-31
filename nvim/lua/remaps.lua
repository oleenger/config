vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>to", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>tc", vim.cmd.NvimTreeClose)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- splits
vim.keymap.set("n", "<leader>-", vim.cmd.split)
vim.keymap.set("n", "<leader><Bar>", vim.cmd.vsplit)

-- Undo and redo
vim.keymap.set("n", "<C-Z>", "u")
vim.keymap.set("n", "<C-Y>", "<C-R>")
vim.keymap.set("i", "<C-Z>", "<C-O>u")
vim.keymap.set("i", "<C-Y>", "<C-O><C-R>")

-- delete word and insert
vim.keymap.set("n", "<leader>r", "ciw")

--local mark = require("harpoon.mark")
--local ui = require("harpoon.ui")
--vim.keymap.set("n", "<leader>a", mark.add_file)
--vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
