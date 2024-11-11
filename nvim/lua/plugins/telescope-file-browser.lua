return {
    "nvim-telescope/telescope-file-browser.nvim",
    extensions = {
        file_browser = {
            initial_mode = 'normal'
        }
    },
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

    config = function()
        -- Open Telescope File Browser
        vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

    end
}
