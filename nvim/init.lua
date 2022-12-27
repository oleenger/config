local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use({"neanias/everforest-nvim", config = function() require("everforest").setup() end, })
    use('theprimeagen/harpoon')
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    use 'nanozuki/tabby.nvim'
    use 'tpope/vim-commentary'

    -- Syntax parser
    use("nvim-treesitter/nvim-treesitter")

    -- Completion
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")

    use("akinsho/bufferline.nvim")

    -- Snippets 
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- Formatting
    use("jose-elias-alvarez/null-ls.nvim")
    -- Language server
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")

    --Data Science
    use 'preservim/vimux'
    use 'greghor/vim-pyShell'
    use 'julienr/vim-cellmode'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Put this at the end after all plugins

    if packer_bootstrap then
        require('packer').sync()

        require("everforest").setup({ background = "hard" })

        require("lualine").setup({
            options = {
                theme = "auto", -- Can also be "auto" to detect automatically.
            }
        })

        require('indent_blankline').setup {
            char = '┊',
            show_trailing_blankline_indent = false,
        }


        require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt" },
        })
        require("colorizer").setup()
        require("gitsigns").setup()
        require("bufferline").setup()


    end

    require('opts')
    require('remaps')
    require('cmd')
    require('plugins.nvim-tree')
    require('plugins.telescope')
    require('plugins.tabby')
    require('plugins.treesitter')

end)

