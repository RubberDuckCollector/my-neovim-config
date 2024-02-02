vim.g.mapleader = " "

-- opts
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 1000 -- cursor will stay 1000 lines from the bottom/top when scrolling down
vim.opt.cmdheight = 2    -- more space in the neovim command line for displaying messages
vim.opt.wrap = false     -- no soft wrap

-- search results highlight themselves reactively
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.splitbelow = true
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
-- vim.opt.foldcolumn = "9"
vim.opt.history = 1000
