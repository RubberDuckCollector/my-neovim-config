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
    -- 'catppuccin/nvim',
    -- 'folke/tokyonight.nvim',
    -- 'navarasu/onedark.nvim',
    -- 'https://github.com/liuchengxu/space-vim-theme.git',

    as = 'kanagawa',
    config = function()
      style = 'wave'
      vim.cmd('colorscheme kanagawa')
    end

    -- as = 'catppuccin',
    -- config = function()
    --   style = 'latte'
    --   vim.cmd('colorscheme catppuccin-frappe')
    -- end

    -- as = 'tokyonight',
    -- config = function()
    -- style = 'wave'
    -- vim.cmd('colorscheme tokyonight')
    -- end

    -- as = 'space_vim_theme',
    -- config = function()
    --   style = 'dark'
    --   vim.cmd('colorscheme space_vim_theme')
    -- end
  })

  use({ 'nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate',
    indent = { enable = false },
  }
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon' -- <leader>a and ctrl t/h
  use 'mbbill/undotree'      -- <leader>u
  use 'Vimjas/vim-python-pep8-indent'
  use 'Raimondi/delimitMate' -- auto completes '', "", (), etc and supports deletion of them
  -- has unwanted behaviour with nvim-ts-autotag where an extra closing > is inserted
  -- either have to disable this when writing html or cope with the tag
  -- or config delimitMate to ignore < characters
  -- or make a tag e.g <p> and substitue the > with another >
  -- thus invoking nvim-ts-autotag but not invoking delimitMate

  -- use 'dapt4/vim-autoSurround'              -- select the text with visual mode and press a button like , or (
  use 'windwp/nvim-ts-autotag'
  use 'lukas-reineke/indent-blankline.nvim' -- :h ibl.config
  -- use 'junegunn/vim-easy-align'

  -- tpope
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-speeddating'

  -- markdown
  use 'dhruvasagar/vim-table-mode'
  use 'mzlogin/vim-markdown-toc'
  use 'folke/zen-mode.nvim'
  use 'folke/twilight.nvim'
  -- use 'vim-pandoc/vim-pandoc-syntax'

  -- use 'preservim/vim-markdown'

  -- use({ -- install without yarn or npm
  --   "iamcco/markdown-preview.nvim",
  --   run = function() vim.fn["mkdp#util#install"]() end,
  -- })

  use 'lfilho/cosco.vim'

  use 'nvim-treesitter/nvim-treesitter-context'

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
  })

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use 'gleam-lang/gleam.vim'

  use 'airblade/vim-gitgutter'

  use 'andweeb/presence.nvim'

  use 'zerowidth/vim-copy-as-rtf'

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
