vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)                                            -- opens the file tree

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
vim.keymap.set("n", "<leader>t", "_ithe <Esc>")

-- 1: el
-- 2: la
-- 3: los
-- 4: las

-- SPANISH
-- vim.keymap.set("n", "1", "_f|ael <Esc>")
-- vim.keymap.set("n", "2", "_f|ala <Esc>")
-- vim.keymap.set("n", "3", "_f|alos <Esc>")
-- vim.keymap.set("n", "4", "_f|alas <Esc>")
-- vim.keymap.set("n", "5", "_f|i (masculine)<Esc>")
-- vim.keymap.set("n", "6", "_f|i (feminine)<Esc>")
-- vim.keymap.set("n", "7", "_f|i (male)<Esc>")
-- vim.keymap.set("n", "8", "_f|i (female)<Esc>")

-- GERMAN
vim.keymap.set("n", "1", "_f|i (reflexive)<Esc>")
vim.keymap.set("n", "2", "_f|i (masculine)<Esc>")
vim.keymap.set("n", "3", "_f|i (feminine)<Esc>")
vim.keymap.set("n", "4", "_f|i (male)<Esc>")
vim.keymap.set("n", "5", "_f|i (female)<Esc>")
