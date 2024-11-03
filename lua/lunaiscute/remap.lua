vim.g.mapleader = " "

-- oil.nvim breaks netrw unless a setting is changed in the oil config
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)                                            -- opens the file tree

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                             -- moves selected text down a line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                                             -- moves selected text up a line
vim.keymap.set("n", "J", "mzJ`z")                                                        -- makes it so the cursor stays in the same place when appending the below line to current line
vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                  -- makes it so that ctrl-d moves down a half page while keeping the cursor in the middle of the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")                                                  -- makes it so that ctrl-u moves up a half page while keeping the cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")                                                        -- makes it so going next keeps the value in the middle (e.g serch result is in the middle of the screen)
vim.keymap.set("n", "N", "Nzzzv")                                                        -- makes it so going back (opposite of "next") keeps the value in the middle (e.g serch result is in the middle of the screen)
vim.keymap.set("x", "<leader>p", '"_dP')                                                 -- makes it so when text is copied and replaced over other text, the replaced text does not then become pastable with p
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- allows you to replace at all instances of the selected text
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

vim.keymap.set("n", "<TAB>", ">>")
vim.keymap.set("n", "<S-TAB>", "<<")
vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

-- this remap makes the current buffer executable
-- used for bash files
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- https://github.com/Eandrju/cellular-automaton.nvim
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>") -- cellular automaton make it rain
vim.keymap.set("n", "<leader>fmg", "<cmd>CellularAutomaton game_of_life<CR>") -- cellular automaton game of life

-- makes it so when you delete something, it does not go to the vim clipboard. the previous clipboard content can still be pasted
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- asbjornHaland: makes it so <leader>y puts the selected text into your system clipboard. (y will cpoy into the vim clipboard.)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- alternative to `:w`, using `:up` and binding it to ZS: only saves the file if it has been changed
vim.keymap.set("n", "ZS", ":up<CR>")

-- cosco
-- press <leader>; to put a semicolon or a comma at the end of the current line
vim.keymap.set("n", "<leader>;", ":CommaOrSemiColon<CR>")

-- go auto basic setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "<leader>m",
      "ipackage main<CR><CR>import ()<Esc>i<CR><TAB>\"fmt\"<CR><Esc>Go<CR>func main() {}<Esc>i<CR><Esc>O",
      { buffer = true })
    vim.keymap.set("n", "<leader>ee", "iif err != nil {}<Esc>i<CR><Esc>Vk=o")
  end
})

-- python auto basic setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<leader>m",
      "idef main():<CR>...<CR><CR><CR><BS>if __name__ == \"__main__\":<CR>main()<Esc>/def main<CR>jS",
      { buffer = true })
  end
})

-- c auto basic setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.keymap.set("n", "<leader>m",
      "i#include <stdio.h><CR><CR>int main() {}<Esc>i<CR><Esc>Oreturn 0;<Esc>O<Esc>O")
  end
})

-- oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- subject special keymaps

-- computer science spiel
-- vim.keymap.set("n", "<leader>i",
--   "i- [ ] **If this box is unchecked, this file has not been fact checked by a teacher. If you're a teacher familiar with OCR H446, submit a pull request or email me! <eggsim49@gmail.com>**<Esc>j0")

-- highlight to current word, surround with **.
-- requires vim-surround by tpope
-- vim.keymap.set("n", "<leader>8", "ysiw*", { noremap = true })

-- vanilla vim remaps for auto closing quotes and brackets
-- to be used if https://github.com/Raimondi/delimitMate doesn't work'

-- vim.keymap.set("i", "\"", "\"\"<Left>")
-- vim.keymap.set("i", "\'", "\'\'<Left>")
-- vim.keymap.set("i", "`", "``<Left>")
-- vim.keymap.set("i", "(", "()<Left>")
-- vim.keymap.set("i", "[", "[]<Left>")
-- vim.keymap.set("i", "{", "{}<Left>")

-- these are for work on flash cards in the format:
-- source_language_prompt|target_language_answer
-- vim.keymap.set("n", "<leader>t", "_ithe <Esc>")

-- 1: el
-- 2: la
-- 3: los
-- 4: las

-- SPANISH
-- vim.keymap.set("i", "1", "<CR>the ", { buffer = true })
-- vim.keymap.set("n", "1", "Ithe ", { buffer = true })
-- vim.keymap.set("n", "1", "_f|ael <Esc>", { buffer = true })
-- vim.keymap.set("n", "2", "_f|ala <Esc>", { buffer = true })
-- vim.keymap.set("n", "3", "_f|alos <Esc>", { buffer = true })
-- vim.keymap.set("n", "4", "_f|alas <Esc>", { buffer = true })
-- vim.keymap.set("n", "5", "_f|i (masculine)<Esc>", { buffer = true })
-- vim.keymap.set("n", "6", "_f|i (feminine)<Esc>", { buffer = true })
-- vim.keymap.set("n", "7", "_f|i (male)<Esc>", { buffer = true })
-- vim.keymap.set("n", "8", "_f|i (female)<Esc>", { buffer = true })
-- vim.keymap.set("n", "9", "_f|i (reflexive)<Esc>", { buffer = true })
-- vim.keymap.set("n", "0", "r><Esc>", { buffer = true }) -- réquiem


-- GERMAN
vim.keymap.set("n", "1", "_f|i (reflexive)<Esc>", { buffer = true })
vim.keymap.set("n", "2", "$F x") -- delete space in between the end of the noun and the ( for the plural ending
vim.keymap.set("n", "3", "$F-x") -- deletet the - in the brackets where the plural ending is
vim.keymap.set("n", "5", "_f|i (masculine)<Esc>", { buffer = true })
vim.keymap.set("n", "6", "_f|i (feminine)<Esc>", { buffer = true })
vim.keymap.set("n", "7", "_f|i (male)<Esc>", { buffer = true })
vim.keymap.set("n", "8", "_f|i (female)<Esc>fdcwdie<Esc>", { buffer = true })
