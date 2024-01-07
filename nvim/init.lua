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
        "neanias/everforest-nvim",
    })

    use({
        -- LSP
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

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
        "windwp/nvim-autopairs",
        "norcalli/nvim-colorizer.lua",
        "ewis6991/gitsigns.nvim",
        "preservim/vimux", -- Data Science
        "julienr/vim-cellmode", -- Jupyter

        -- Harpoon
        use({
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            requires = { { "nvim-lua/plenary.nvim" } },
        }),
        -- Telescope
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.5",
            requires = { { "nvim-lua/plenary.nvim" } },
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

        {
            "nvim-tree/nvim-tree.lua",
            tag = "nightly", -- optional, updated every week. (see issue #1193)
        },

        {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        },
    })

    if packer_bootstrap then
        require("packer").sync()
        require("everforest").setup({
            background = "hard",
        })
        require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt" },
        })
        require("colorizer").setup()
        require("gitsigns").setup()

        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ansiblels" },
        })
        require("lspconfig").ansiblels.setup({
            settings = {
                filetypes = { "ansible" },
            },
        })
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
