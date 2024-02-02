-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        -- 'rose-pine/nvim',
        -- 'scottmckendry/cyberdream.nvim',
        -- 'alexmozaidze/palenight.nvim',
        'rebelot/kanagawa.nvim', -- https://github.com/rebelot/kanagawa.nvim
        -- 'navarasu/onedark.nvim',
        as = 'kanagawa',
        config = function()
            style = 'wave'
            vim.cmd('colorscheme kanagawa')
        end
    })
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')


    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- GAMES
    use({ 'theprimeagen/vim-be-good', lazy = false })
    use({ 'alec-gibson/nvim-tetris', lazy = false })
    use({ 'eandrju/cellular-automaton.nvim', lazy = false })
    use({
        'alanfortlink/blackjack.nvim',
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    })

    use({ 'zyedidia/vim-snake', lazy = false })

    use 'tpope/vim-commentary'

    use({
        'jim-fx/sudoku.nvim',
        cmd = "Sudoku",
        config = function()
            -- These are the defaults for the settings
            require("sudoku").setup({
                persist_settings = true, -- safe the settings under vim.fn.stdpath("data"), usually ~/.local/share/nvim,
                persist_games = true,    -- persist a history of all played games
                default_mappings = true, -- if set to false you need to set your own, like the following:
                mappings = {
                    { key = "x",     action = "clear_cell" },
                    { key = "r1",    action = "insert=1" },
                    { key = "r2",    action = "insert=2" },
                    { key = "r3",    action = "insert=3" },
                    -- ...
                    { key = "r9",    action = "insert=9" },
                    { key = "gn",    action = "new_game" },
                    { key = "gr",    action = "reset_game" },
                    { key = "gs",    action = "view=settings" },
                    { key = "gt",    action = "view=tip" },
                    { key = "gz",    action = "view=zen" },
                    { key = "gh",    action = "view=help" },
                    { key = "u",     action = "undo" },
                    { key = "<C-r>", action = "redo" },
                    { key = "+",     action = "increment" },
                    { key = "-",     action = "decrement" },
                },
                custom_highlights = {
                    board = { fg = "#7d7d7d" },
                    number = { fg = "white", bg = "black" },
                    active_menu = { fg = "white", bg = "black", gui = "bold" },
                    hint_cell = { fg = "white", bg = "yellow" },
                    square = { bg = "#292b35", fg = "white" },
                    column = { bg = "#14151a", fg = "#d5d5d5" },
                    row = { bg = "#14151a", fg = "#d5d5d5" },
                    settings_disabled = { fg = "#8e8e8e", gui = "italic" },
                    same_number = { fg = "white", gui = "bold" },
                    set_number = { fg = "white", gui = "italic" },
                    error = { fg = "white", bg = "#843434" },
                }
            })
        end,
    })
end)
