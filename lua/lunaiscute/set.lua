vim.g.mapleader = " "

-- opts
-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.smartindent = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- with these 2 settings, the cursor will always stay in the middle of the screen where possible.
-- I like this because it's great for readability when i'm writing long lines of documentation in .md files.
vim.opt.scrolloff = 1000   -- cursor will stay 1000 lines from the bottom/top when scrolling down
vim.opt.sidescrolloff = 12 -- cursor will stay 10 lines from the left/right when side-scrolling

vim.opt.cmdheight = 2      -- more space in the neovim command line for displaying messages
vim.opt.wrap = false       -- no soft wrap

-- search results highlight themselves reactively
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.foldmethod = 'manual'
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.splitbelow = true
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
-- vim.opt.foldcolumn = "9"
vim.opt.history = 1000

function Set_filetype_settings()
    local concerned_files = { "lua", "c", "cpp", "rb", "haskell" }
    local filetype = vim.bo.filetype

    local found = false
    for _, lang in ipairs(concerned_files) do
        if lang == filetype then
            found = true
            break
        end
    end

    if found then
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
    else
        do
        end
    end
end

-- Set autocmd for FileType event to trigger the function
vim.cmd([[
  augroup FileTypeSpecificAutocommands
    autocmd!
    autocmd FileType * lua Set_filetype_settings()
  augroup END
]])
