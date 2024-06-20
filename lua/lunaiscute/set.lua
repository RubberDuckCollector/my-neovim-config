vim.g.mapleader = " "

-- opts
-- vim.opt.guicursor = ""

-- nvim table mode
-- this disables syntax highlighting when within table mode
-- doing so dramatically speeds up nvim
-- which means the syntax highlighting you get when in table mode is slowing down a lot
vim.g.table_mode_syntax = 0

vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.smartindent = false
-- vim.opt.colorcolumn = "80"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*.txt",
--     callback = function()
--         vim.cmd("setlocal scrolloff=1000")
--     end
-- })

-- Set scrolloff to 1000 for .txt files
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--     pattern = "*.txt",
--     callback = function()
--         vim.cmd("setlocal scrolloff=1000")
--     end
-- })

-- Set scrolloff to 8 for all other file types
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--     pattern = "*",
--     callback = function()
--         if vim.bo.filetype ~= "txt" then
--             vim.opt_local.scrolloff = 8
--         else
--             vim.opt_local.scrolloff = 1000
--         end
--     end
-- })

-- vim.opt.scrolloff = 8
vim.opt.scrolloff = 1000

vim.opt.sidescrolloff = 12 -- cursor will stay 12 lines from the left/right when side-scrolling

vim.opt.cmdheight = 2      -- more space in the neovim command line for displaying messages
vim.opt.wrap = false       -- no soft wrap

-- search results highlight themselves reactively
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.foldmethod = 'manual'
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 9 -- makes it so all folds are opened when file is opened, folds are still able to be closed
vim.opt.foldenable = true
vim.opt.splitbelow = true
vim.opt.conceallevel = 0
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
-- vim.opt.foldcolumn = "9" -- shows all folds in the left hand column to the left of where the numbers are
vim.opt.history = 1000
vim.opt.updatetime = 50

-- spelling
-- vim.opt.spelllang = 'es,en_gb'
-- vim.opt.spell = true

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
        if filetype == "ruby" then
            vim.bo.tabstop = 4
            vim.bo.softtabstop = 4
            vim.bo.shiftwidth = 4
            -- elseif filetype == "markdown" or filetype == "txt" then
            --   vim.opt.spell = true
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

-- highlight_yank
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]])

-- cosco
vim.g.cosco_filetype_whitelist = { "javascript", "typescript", "c", "cpp", "csharp", "rust" }
