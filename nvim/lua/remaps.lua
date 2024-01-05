vim.g.mapleader = " "

-- NvimTree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>to", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>tc", vim.cmd.NvimTreeClose)

-- splits
vim.keymap.set("n", "<leader>-", vim.cmd.split)
vim.keymap.set("n", "<leader><Bar>", vim.cmd.vsplit)

-- Undo and redo
vim.keymap.set("n", "<C-Z>", "u")
vim.keymap.set("n", "<C-Y>", "<C-R>")
vim.keymap.set("i", "<C-Z>", "<C-O>u")
vim.keymap.set("i", "<C-Y>", "<C-O><C-R>")

-- Comment
vim.keymap.set("n", "<leader>c", "gcc", { remap = true }) -- line
vim.keymap.set("n", "<leader>pc", "gcip", { remap = true }) -- paragraph

-- delete word and insert
vim.keymap.set("n", "<leader>r", "ciw")

--Search replace
vim.api.nvim_set_keymap('n', '<leader>s', ':%s/<c-r><c-w>//g<left><left>', {})
vim.api.nvim_set_keymap('n', '<leader>xml', ':%s/<<c-r><c-w>>//g<left><left>', {})

-- Format code
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", {})
