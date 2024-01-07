local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use({
        "wbthomason/packer.nvim",
        "nvim-lua/plenary.nvim",

        -- Colorscheme
        {
            "neanias/everforest-nvim",
            config = function()
                require("everforest").setup({
                    background = "hard",
                })
            end,
        },

        -- LSP
        -- Mason
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },

        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason").setup({
                    ensure_installed = {
                        "lua_ls",
                        "ansiblels",
                    },
                })
            end,
        },

        {
            "neovim/nvim-lspconfig",
            config = function()
                require("lspconfig").setup({
                    settings = {
                        filetypes = { "ansible" },
                    },
                })
            end,
        },

        -- Autocomplete
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "chase/vim-ansible-yaml",
        "mfussenegger/nvim-lint",
        "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
        "nanozuki/tabby.nvim",
        "nvim-treesitter/nvim-treesitter",
        "tpope/vim-fugitive",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        -- "jose-elias-alvarez/null-ls.nvim",
        "preservim/vimux", -- Data Science
        "julienr/vim-cellmode", -- Jupyter

        -- Gitsigns
        {
            "ewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end,
        },

        -- Colorizer
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        },

        -- Autopairs
        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({
                    disable_filetype = { "TelescopePrompt" },
                })
            end,
        },

        -- Harpoon
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
        },

        -- Telescope
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.5",
        },

        -- Commenting
        {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        },

        -- Conform formatting
        {
            "stevearc/conform.nvim",
            config = function()
                require("conform").setup()
            end,
        },

        -- Nvim-Tree
        {
            "nvim-tree/nvim-tree.lua",
            tag = "nightly", -- optional, updated every week. (see issue #1193)
        },

        -- Lualine
        {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        },
    })

    if packer_bootstrap then
        require("packer").sync()
    end

    require("opts")
    require("cmd")
    require("plugins.nvim-tree")
    require("plugins.nvim-cmp")
    require("plugins.telescope")
    require("plugins.tabby")
    require("plugins.treesitter")
    require("plugins.lualine")
    require("plugins.nvim-lint")
    require("plugins.conform")
    require("plugins.harpoon")
    require("plugins.vim-ansible-yaml")
    require("remaps")
end)
