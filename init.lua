-- ============================================================
-- SECTION 1: FOUNDATION
-- Core Neovim settings, leaders, options, basic keymaps, basic autocmds
-- ============================================================
do
  vim.loader.enable()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  vim.g.have_nerd_font = true

  vim.o.number = true
  vim.o.relativenumber = true

  vim.o.mouse = "a"

  vim.o.showmode = false

  -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  -- vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

  -- Enable break indent
  vim.o.breakindent = true

  -- Enable undo/redo changes even after closing and reopening a file
  vim.o.undofile = true

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  vim.o.ignorecase = true
  vim.o.smartcase = true

  -- Keep signcolumn on by default
  vim.o.signcolumn = "yes"

  -- Decrease update time
  vim.o.updatetime = 250

  -- Decrease mapped sequence wait time
  vim.o.timeoutlen = 300

  -- Configure how new splits should be opened
  vim.o.splitright = true
  vim.o.splitbelow = true

  vim.o.scrolloff = 100

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  --
  --  Notice listchars is set using `vim.opt` instead of `vim.o`.
  --  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
  --   See `:help lua-options`
  --   and `:help lua-guide-options`
  vim.o.list = true
  vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

  -- Preview substitutions live, as you type!
  vim.o.inccommand = "split"

  -- Show which line your cursor is on
  vim.o.cursorline = true

  -- Minimal number of screen lines to keep above and below the cursor.
  vim.o.scrolloff = 10

  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  vim.o.confirm = true

  -- [[ Basic Keymaps ]]
  --  See `:help vim.keymap.set()`

  -- Clear highlights on search when pressing <Esc> in normal mode
  --  See `:help hlsearch`
  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

  -- Diagnostic Config & Keymaps
  --  See `:help vim.diagnostic.Opts`
  vim.diagnostic.config({
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float({
          bufnr = bufnr,
          scope = "cursor",
          focus = false,
        })
      end,
    },
  })

  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

  -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
  -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
  -- is not what someone will guess without a bit more experience.
  --
  -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
  -- or just use <C-\><C-n> to exit terminal mode
  vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

  -- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
  -- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
  -- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
  -- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
  -- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

  -- [[ Basic Autocommands ]]
  --  See `:help lua-guide-autocommands`

  -- Highlight when yanking (copying) text
  --  Try it with `yap` in normal mode
  --  See `:help vim.hl.on_yank()`
  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
      vim.hl.on_yank()
    end,
  })

  -- nvim table mode
  -- this disables syntax highlighting when within table mode
  -- doing so dramatically speeds up nvim
  -- which means the syntax highlighting you get when in table mode is slowing down a lot
  vim.g.table_mode_syntax = 0
  vim.o.winborder = "rounded"
  vim.o.signcolumn = "yes"
  vim.o.termguicolors = true
  vim.o.nu = true
  vim.o.relativenumber = true -- relative line numbers
  vim.o.tabstop = 4
  vim.o.softtabstop = 4
  vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
  vim.o.expandtab = true
  vim.o.autoindent = true
  vim.o.smartindent = false
  vim.opt.completeopt = { "menuone", "noselect", "popup" }
  -- vim.o.colorcolumn = "80"
  -- vim.o.smartindent = true

  vim.o.swapfile = false
  vim.o.backup = false
  vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
  vim.o.undofile = true

  vim.o.mousescroll = "ver:1,hor:1"

  -- Set scrolloff to 8 for all other file types
  -- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  --     pattern = "*",
  --     callback = function()
  --         if vim.bo.filetype ~= "txt" then
  --             vim.o.local.scrolloff = 8
  --         else
  --             vim.o.local.scrolloff = 1000
  --         end
  --     end
  -- })

  vim.o.scrolloff = 1000
  vim.o.sidescrolloff = 12 -- cursor will stay 12 lines from the left/right when side-scrolling
  vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages
  vim.o.wrap = false -- no soft wrap
  -- search results highlight themselves reactively
  vim.o.hlsearch = true
  vim.o.incsearch = true
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.treesitter.language.register("xml", { "xaml", "axaml" })
  vim.o.foldlevel = 9 -- makes it so all folds are opened when file is opened, folds are still able to be closed
  vim.o.foldenable = true
  vim.o.splitbelow = true
  vim.o.conceallevel = 0
  vim.o.cursorline = false -- comment this out or set to false if writing flashcards
  vim.o.cursorcolumn = false
  -- vim.o.foldcolumn = "2" -- shows all folds in the left hand column to the left of where the numbers are
  vim.o.history = 1000
  vim.o.updatetime = 4000

  -- tinyinlinediagnostic.nvim
  vim.diagnostic.config({ virtual_text = false })

  -- spelling
  -- vim.o.spelllang = 'es,en_gb'
  -- vim.o.spell = true

  vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- allows you to replace at all instances of the selected text
  vim.keymap.set("n", "<leader>tmr", "<CMD>TableModeRealign<CR>", { buffer = true })
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  vim.keymap.set("n", "<leader>o", "<CMD>update<CR> <CMD>source<CR>")
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>co", "mz i✓ <Esc>`z") -- inserts a tick for a correct answer
  vim.keymap.set("n", "<leader>i", "mz i✗ <Esc>`z") -- inserts a cross for an incorrect answer
  vim.keymap.set("n", "<Esc>", "<CMD>noh<CR>")
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moves selected text down a line
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- moves selected text up a line
  vim.keymap.set("n", "<leader>g", "mzgqap`z") -- sets a mark (z), formats paragraph, goes back to mark
  vim.keymap.set("x", "<leader>p", '"_dP') -- makes it so when text is copied and replaced over other text, the replaced text does not then become pastable with p
  vim.keymap.set("n", "<C-d>", "<C-d>zz") -- makes it so that ctrl-d moves down a half page while keeping the cursor in the middle of the screen
  vim.keymap.set("n", "<C-u>", "<C-u>zz") -- makes it so that ctrl-u moves up a half page while keeping the cursor in the middle of the screen
  vim.keymap.set("v", "<S-TAB>", "<gv")
  vim.keymap.set("n", "<S-TAB>", "<<")
  vim.keymap.set("v", "<TAB>", ">gv")
  vim.keymap.set("n", "<TAB>", ">>")
  vim.keymap.set("n", "J", "mzJ`z") -- makes it so the cursor stays in the same place when appending the below line to current line
  vim.keymap.set("n", "n", "nzzzv") -- makes it so going next keeps the value in the middle (e.g serch result is in the middle of the screen)
  vim.keymap.set("n", "N", "Nzzzv") -- makes it so going back (opposite of "next") keeps the value in the middle (e.g serch result is in the middle of the screen)
  vim.keymap.set("n", "H", "^")
  vim.keymap.set("n", "L", "$")

  local transparent = false

  vim.api.nvim_create_user_command("ToggleOpacity", function()
    transparent = not transparent

    if transparent then
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
      print("Transparency enabled")
    else
      vim.cmd.colorscheme(vim.g.colors_name)
      print("Transparency disabled")
    end
  end, {})

  -- these are for work on flash cards in the format:
  -- source_language_prompt|target_language_answer
  -- vim.keymap.set("n", "<leader>t", "_ithe <Esc>")

  -- 1: el
  -- 2: la
  -- 3: los
  -- 4: las

  local german_enabled = false
  local spanish_enabled = false
  local languages = { "Spanish", "German" }

  vim.api.nvim_create_user_command("ToggleLanguageKeymaps", function(opts)
    if opts.fargs[1]:lower() == "spanish" then
      if spanish_enabled == false then
        spanish_enabled = true
        vim.keymap.set("i", "1", "<CR>the ", { buffer = true })
        vim.keymap.set("n", "1", "_f|ael <Esc>", { buffer = true })
        vim.keymap.set("n", "2", "_f|ala <Esc>", { buffer = true })
        vim.keymap.set("n", "3", "_f|alos <Esc>", { buffer = true })
        vim.keymap.set("n", "4", "_f|alas <Esc>", { buffer = true })
        vim.keymap.set("n", "5", "_f|i (masculine)<Esc>", { buffer = true })
        vim.keymap.set("n", "6", "_f|i (feminine)<Esc>", { buffer = true })
        vim.keymap.set("n", "7", "_f|i (male)<Esc>", { buffer = true })
        vim.keymap.set("n", "8", "_f|i (female)<Esc>", { buffer = true })
        vim.keymap.set("n", "9", "_f|i (reflexive)<Esc>", { buffer = true })
        vim.keymap.set("n", "0", "r><Esc>", { buffer = true }) -- réquiem
        print("Spanish keymaps on")
      else -- if spanish is already enabled, disable it to complete the toggle functionality
        spanish_enabled = false
        vim.keymap.del({ "n", "i" }, "1", { buffer = true })
        vim.keymap.del({ "n" }, "2", { buffer = true })
        vim.keymap.del({ "n" }, "3", { buffer = true })
        vim.keymap.del({ "n" }, "4", { buffer = true })
        vim.keymap.del({ "n" }, "5", { buffer = true })
        vim.keymap.del({ "n" }, "6", { buffer = true })
        vim.keymap.del({ "n" }, "7", { buffer = true })
        vim.keymap.del({ "n" }, "8", { buffer = true })
        vim.keymap.del({ "n" }, "9", { buffer = true })
        vim.keymap.del({ "n" }, "0", { buffer = true })
        print("Spanish keymaps off")
      end
    elseif opts.fargs[1]:lower() == "german" then
      if german_enabled == false then
        german_enabled = true
        vim.keymap.set("n", "1", "_f|i (reflexive)<Esc>", { buffer = true })
        vim.keymap.set("n", "2", "$F x", { buffer = true }) -- delete space in between the end of the noun and the ( for the plural ending
        vim.keymap.set("n", "3", "$F-x", { buffer = true }) -- delete the - in the brackets where the plural ending is
        vim.keymap.set("n", "5", "_f|i (masculine)<Esc>", { buffer = true })
        vim.keymap.set("n", "6", "_f|i (feminine)<Esc>", { buffer = true })
        vim.keymap.set("n", "7", "_f|i (male)<Esc>", { buffer = true })
        vim.keymap.set("n", "8", "_f|i (female)<Esc>fdcwdie<Esc>", { buffer = true })
        vim.keymap.set("n", "9", "_f|i (separable verb)<Esc>", { buffer = true })
        print("German keymaps on")
      else -- if german is already enabled, disable it to complete the toggle functionality
        german_enabled = false
        vim.keymap.del({ "n" }, "1", { buffer = true })
        vim.keymap.del({ "n" }, "2", { buffer = true })
        vim.keymap.del({ "n" }, "3", { buffer = true })
        vim.keymap.del({ "n" }, "5", { buffer = true })
        vim.keymap.del({ "n" }, "6", { buffer = true })
        vim.keymap.del({ "n" }, "7", { buffer = true })
        vim.keymap.del({ "n" }, "8", { buffer = true })
        vim.keymap.del({ "n" }, "9", { buffer = true })
        print("German keymaps off")
      end
    else
      print("No recognised languages detected")
    end
  end, {
    nargs = 1,
    desc = "Toggles custom keymaps for different languages for the purposes of writing flashcards",
    complete = function(ArgLead, CmdLine, CursorPos)
      local matches = {}
      for _, name in ipairs(languages) do
        if name:match("^" .. ArgLead) then
          table.insert(matches, name)
        end
      end
      return matches
    end,
  })

  -- https://vi.stackexchange.com/a/2285
  -- deletes all trailing whitespace in a file
  vim.keymap.set("n", "<leader>ds", function()
    local saved_search = vim.fn.getreg("/")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setreg("/", saved_search)
  end, { noremap = true, silent = true })

  -- vim.keymap.set("n", "<leader>v", ft = "lua", desc = "LÖVE" ),
  vim.keymap.set("n", "<leader>vv", "<cmd>LoveRun<cr>")
  vim.keymap.set("n", "<leader>vs", "<cmd>LoveStop<cr>")

  -- this remap makes the current buffer executable
  -- used for bash files
  vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

  vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

  vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)

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

  -- alternative to `:w`, using `:up` and binding it to ZS: only saves the file if it has been changed
  vim.keymap.set("n", "ZS", ":up<CR>")

  -- go auto basic setup
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>m",
        'ipackage main<CR><CR>import ()<Esc>i<CR><TAB>"fmt"<CR><Esc>Go<CR>func main() {}<Esc>i<CR><Esc>O',
        { buffer = true }
      )
      vim.keymap.set("n", "<leader>ee", "iif err != nil {}<Esc>i<CR><Esc>Vk=o<Esc>Slog.Fatal(err)<Esc>")
    end,
  })

  -- python auto basic setup
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>m",
        'idef main():<CR>...<CR><CR><CR><BS>if __name__ == "__main__":<CR>main()<Esc>/def main<CR>jS',
        { buffer = true }
      )
    end,
  })

  -- c auto basic setup
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>m",
        "i#include <stdio.h><CR><CR>int main() {}<Esc>i<CR><Esc>Oreturn 0;<Esc>O<Esc>O",
        { buffer = true }
      )
    end,
  })

  -- markview.nvim
  -- by creating autocmds based on filetype, you can have the same keyboard shortcut behave differently based on the filetype
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
      -- vim.keymap.set("n", "<leader>m", "<CMD>Markview<CR>", { buffer = true })
      vim.keymap.set(
        "n",
        "<leader>.",
        'i---<CR>---<Esc>Otitle: ""<CR>author: ""<CR>date: ""<CR>mainfont: "Adwaita Sans"<CR>monofont: "ComicShannsMono Nerd Font"<CR>fontsize: 12pt<Esc>jo<CR>',
        { buffer = true }
      )
      vim.keymap.set("n", "<leader>p", "<CMD>MarkdownPreviewToggle<CR>", { buffer = true })

      -- these enable and disable Markview given that markview's enable key in the preview table is set to false

      -- these are here because the syntax highlighting for headers is odd with
      -- treesitter only, and enabling and disabling Markview makes the color of
      -- the header text and its corresponding hashtags be the same color
      -- vim.cmd("Markview")
      -- vim.cmd("Markview")
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
      -- set up basic template
      vim.keymap.set(
        "n",
        "<leader>m",
        'i#let date = datetime()<Esc>i<CR><Esc>O<Tab>year: 0000,<CR>month: 0,<CR>day: 00,<Esc>jo<Cr>#set text()<Esc>ifont: ""<Esc>iAdwaita Sans<Esc>o<CR>#date.display()<CR><CR>= Example Header<CR><CR>== Example Subheader<Esc>=ggG',
        { buffer = true }
      )
      vim.keymap.set("n", "<leader>p", "<CMD>TypstPreview<CR>", { buffer = true })
    end,
  })

  -- subject special keymaps

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
end

-- ============================================================
-- SECTION 2: PLUGIN MANAGER INTRO
-- vim.pack intro, build hooks
-- ============================================================
do
  -- [[ Intro to `vim.pack` ]]
  -- `vim.pack` is a new plugin manager built into Neovim,
  --  which provides a Lua interface for installing and managing plugins.
  --
  --  See `:help vim.pack`, `:help vim.pack-examples` or the
  --  excellent blog post from the creator of vim.pack and mini.nvim:
  --  https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
  --
  --  To inspect plugin state and pending updates, run
  --    :lua vim.pack.update(nil, { offline = true })
  --
  --  To update plugins, run
  --    :lua vim.pack.update()
  --
  --
  --  Throughout the rest of the config there will be examples
  --  of how to install and configure plugins using `vim.pack`.
  --
  --  In this section we set up some autocommands to run build
  --  steps for certain plugins after they are installed or updated.

  local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()
    if result.code ~= 0 then
      local stderr = result.stderr or ""
      local stdout = result.stdout or ""
      local output = stderr ~= "" and stderr or stdout
      if output == "" then
        output = "No output from build command."
      end
      vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
    end
  end

  -- This autocommand runs after a plugin is installed or updated and
  --  runs the appropriate build command for that plugin if necessary.
  --
  -- See `:help vim.pack-events`
  vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= "install" and kind ~= "update" then
        return
      end

      if name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
        run_build(name, { "make" }, ev.data.path)
        return
      end

      if name == "LuaSnip" then
        if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
          run_build(name, { "make", "install_jsregexp" }, ev.data.path)
        end
        return
      end

      if name == "nvim-treesitter" then
        if not ev.data.active then
          vim.cmd.packadd("nvim-treesitter")
        end
        vim.cmd("TSUpdate")
        return
      end
    end,
  })
end

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo)
  return "https://github.com/" .. repo
end

-- ============================================================
-- SECTION 3: UI / CORE UX PLUGINS
-- guess-indent, gitsigns, which-key, colorscheme, todo-comments, mini modules
-- ============================================================
do
  -- [[ Installing and Configuring Plugins ]]
  --
  -- To install a plugin simply call `vim.pack.add` with its git url.
  -- This will download the default branch of the plugin, which will usually be `main` or `master`
  -- You can also have more advanced specs, which we will talk about later.
  --
  -- For most plugins its not enough to install them, you also need to call their `.setup()` to start them.
  --
  -- For example, lets say we want to install `guess-indent.nvim` - a plugin for
  -- automatically detecting and setting the indentation.
  --
  -- We first install it from https://github.com/NMAC427/guess-indent.nvim
  -- and then call its `setup()` function to start it with default settings.
  vim.pack.add({ gh("NMAC427/guess-indent.nvim") })
  require("guess-indent").setup({})

  -- Because lua is a real programming language, you can also have some logic to your installation -
  -- like only installing a plugin if a condition is met.
  --
  -- Here we only install `nvim-web-devicons` (which adds pretty icons) if we have a Nerd Font,
  -- since otherwise the icons won't display properly.
  if vim.g.have_nerd_font then
    vim.pack.add({ gh("nvim-tree/nvim-web-devicons") })
  end

  -- Here is a more advanced configuration example that passes options to `gitsigns.nvim`
  --
  -- See `:help gitsigns` to understand what each configuration key does.
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  vim.pack.add({ gh("lewis6991/gitsigns.nvim") })
  require("gitsigns").setup({
    signs = {
      add = { text = "+" }, ---@diagnostic disable-line: missing-fields
      change = { text = "~" }, ---@diagnostic disable-line: missing-fields
      delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = "~" }, ---@diagnostic disable-line: missing-fields
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Jump to next git [c]hange" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Jump to previous git [c]hange" })

      -- Actions
      -- visual mode
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "git [s]tage hunk" })
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "git [r]eset hunk" })
      -- normal mode
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "git preview hunk [i]nline" })
      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "git [b]lame line" })
      map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
      map("n", "<leader>hD", function()
        gitsigns.diffthis("@")
      end, { desc = "git [D]iff against last commit" })
      map("n", "<leader>hQ", function()
        gitsigns.setqflist("all")
      end, { desc = "git hunk [Q]uickfix list (all files in repo)" })
      map("n", "<leader>hq", gitsigns.setqflist, { desc = "git hunk [q]uickfix list (all changes in this file)" })
      -- Toggles
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
      map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "[T]oggle git intra-line [w]ord diff" })

      -- Text object
      map({ "o", "x" }, "ih", gitsigns.select_hunk)
    end,
  })

  -- Useful plugin to show you pending keybinds.
  vim.pack.add({ gh("folke/which-key.nvim") })
  require("which-key").setup({
    -- Delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    -- Document existing key chains
    spec = {
      { "<leader>s", group = "[S]earch", mode = { "n", "v" } },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } }, -- Enable gitsigns recommended keymaps first
      { "gr", group = "LSP Actions", mode = { "n" } },
    },
  })

  -- [[ Colorscheme ]]
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command under that to load whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

  vim.pack.add({ gh("ribru17/bamboo.nvim") })
  ---@diagnostic disable-next-line: missing-fields
  require("bamboo").setup({
    styles = {
      comments = { italic = false }, -- Disable italics in comments
    },
  })

  -- Load the colorscheme here.
  -- Like many other themes, this one has different styles, and you could load
  -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  -- vim.cmd.colorscheme 'bamboo'
  -- vim.cmd.colorscheme 'seoul256'
  -- vim.cmd.colorscheme 'kanagawa-wave'
  -- vim.cmd.colorscheme 'onedark'

  -- Highlight todo, notes, etc in comments
  vim.pack.add({ gh("folke/todo-comments.nvim") })
  require("todo-comments").setup({ signs = false })

  -- [[ mini.nvim ]]
  --  A collection of various small independent plugins/modules
  vim.pack.add({ gh("nvim-mini/mini.nvim") })

  -- Better Around/Inside textobjects
  --
  -- Examples:
  --  - va)  - [V]isually select [A]round [)]paren
  --  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
  --  - ci'  - [C]hange [I]nside [']quote
  require("mini.ai").setup({
    -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
    mappings = {
      around_next = "aa",
      inside_next = "ii",
    },
    n_lines = 500,
  })

  local tpope_plugins = {
    gh("tpope/vim-repeat"),
    gh("tpope/vim-surround"),
    gh("tpope/vim-fugitive"),
    gh("tpope/vim-commentary"),
    gh("tpope/vim-speeddating"),
  }

  vim.pack.add(tpope_plugins)

  vim.pack.add({ gh("stevearc/oil.nvim") })
  require("oil").setup({
    view_options = {
      show_hidden = true,
    },
  })

  vim.pack.add({ gh("theprimeagen/harpoon") })
  -- require 'harpoon'.setup {
  --   mark = require("harpoon.mark"),
  --   ui = require("harpoon.ui"),

  --   vim.keymap.set("n", "<leader>a", mark.add_file),
  --   vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu),
  --   vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end),
  --   vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end),
  --   vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end),
  --   vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end),
  -- }

  vim.pack.add({ { src = "https://github.com/S1M0N38/love2d.nvim", version = vim.version.range("3") } })
  require("love2d").setup({})
  vim.keymap.set("n", "<leader>vr", "<cmd>Love run<cr>", { desc = "Run LÖVE" })
  vim.keymap.set("n", "<leader>vw", "<cmd>Love watch<cr>", { desc = "Watch LÖVE" })
  vim.keymap.set("n", "<leader>vi", "<cmd>Love info<cr>", { desc = "Info LÖVE" })
  vim.keymap.set("n", "<leader>vs", "<cmd>Love stop<cr>", { desc = "Stop LÖVE" })
  vim.keymap.set("n", "<leader>vo", "<cmd>Love output<cr>", { desc = "Output panel" })

  vim.pack.add({ gh("wallpants/github-preview.nvim") }) -- BUN IS A DEPENDENCY
  require("github-preview").setup({
    host = "localhost",
    -- port used by local server
    port = 6041,
    -- set to "true" to force single-file mode & disable repository mode
    single_file = false,
    theme = {
      -- "system" | "light" | "dark"
      name = "system",
      high_contrast = false,
    },
    -- define how to render <details> tags on init/content-change
    -- true: <details> tags are rendered open
    -- false: <details> tags are rendered closed
    details_tags_open = true,
    cursor_line = {
      disable = false,
      -- CSS color
      -- if you provide an invalid value, cursorline will be invisible
      color = "#c86414",
      opacity = 0.2,
    },
    scroll = {
      disable = false,
      -- Between 0 and 100
      -- VERY LOW and VERY HIGH numbers might result in cursorline out of screen
      top_offset_pct = 35,
    },
    -- for debugging
    -- nil | "debug" | "verbose"
    log_level = nil,
  })

  vim.pack.add({ gh("chomosuke/typst-preview.nvim") })
  -- vim.pack.add { gh 'junegunn/seoul256.vim' }
  -- vim.pack.add { gh 'rebelot/kanagawa.nvim' }
  vim.pack.add({ gh("navarasu/onedark.nvim") })
  require("onedark").setup({ style = "darker" })
  require("onedark").load()
  vim.pack.add({ gh("alanfortlink/blackjack.nvim") })
  vim.pack.add({ gh("dhruvasagar/vim-table-mode") })
  -- vim.pack.add { gh 'lukas-reineke/indent-blankline.nvim' }
  -- return 'ibl'.setup({})
  vim.pack.add({ gh("mzlogin/vim-markdown-toc") })
  vim.pack.add({ gh("mbbill/undotree") })
  vim.pack.add({ gh("Raimondi/delimitMate.git") })
  vim.pack.add({ gh("jbyuki/venn.nvim") })
  -- venn.nvim: enable or disable keymappings
  function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
      vim.b.venn_enabled = true
      vim.cmd([[setlocal ve=all]])
      -- draw a line on HJKL keystokes
      vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
      -- draw a box by pressing "f" with visual selection
      vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
    else
      vim.cmd([[setlocal ve=]])
      vim.api.nvim_buf_del_keymap(0, "n", "J")
      vim.api.nvim_buf_del_keymap(0, "n", "K")
      vim.api.nvim_buf_del_keymap(0, "n", "L")
      vim.api.nvim_buf_del_keymap(0, "n", "H")
      vim.api.nvim_buf_del_keymap(0, "v", "f")
      vim.b.venn_enabled = nil
    end
  end
  -- toggle keymappings for venn using <leader>v
  vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true })

  -- vim.pack.add { gh 'saghen/filler-begone.nvim' }

  -- Simple and easy statusline.
  --  You could remove this setup call if you don't like it,
  --  and try some other statusline plugin
  -- local statusline = require 'mini.statusline'
  -- Set `use_icons` to true if you have a Nerd Font
  -- statusline.setup { use_icons = vim.g.have_nerd_font }

  -- You can configure sections in the statusline by overriding their
  -- default behavior. For example, here we set the section for
  -- cursor location to LINE:COLUMN
  ---@diagnostic disable-next-line: duplicate-set-field
  -- statusline.section_location = function() return '%2l:%-2v' end

  -- ... and there is more!
  --  Check out: https://github.com/nvim-mini/mini.nvim

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
      -- load the optional plugin
      vim.pack.add({ gh("yousefhadder/markdown-plus.nvim") })
      -- then run the plugin setup if needed
      if package.loaded["markdown-plus"] == nil then
        require("markdown-plus").setup()
      end
    end,
  })
end

-- ============================================================
-- SECTION 4: SEARCH & NAVIGATION
-- Telescope setup, keymaps, LSP picker mappings
-- ============================================================
do
  -- [[ Fuzzy Finder (files, lsp, etc) ]]
  --
  -- Telescope is a fuzzy finder that comes with a lot of different things that
  -- it can fuzzy find! It's more than just a "file finder", it can search
  -- many different aspects of Neovim, your workspace, LSP, and more!
  --
  -- There are lots of other alternative pickers (like snacks.picker, or fzf-lua)
  -- so feel free to experiment and see what you like!
  --
  -- The easiest way to use Telescope, is to start by doing something like:
  --  :Telescope help_tags
  --
  -- After running this command, a window will open up and you're able to
  -- type in the prompt window. You'll see a list of `help_tags` options and
  -- a corresponding preview of the help.
  --
  -- Two important keymaps to use while in Telescope are:
  --  - Insert mode: <c-/>
  --  - Normal mode: ?
  --
  -- This opens a window that shows you all of the keymaps for the current
  -- Telescope picker. This is really useful to discover what Telescope can
  -- do as well as how to actually do it!

  ---@type (string|vim.pack.Spec)[]
  local telescope_plugins = {
    gh("nvim-lua/plenary.nvim"),
    gh("nvim-telescope/telescope.nvim"),
    gh("nvim-telescope/telescope-ui-select.nvim"),
  }
  if vim.fn.executable("make") == 1 then
    table.insert(telescope_plugins, gh("nvim-telescope/telescope-fzf-native.nvim"))
  end

  -- NOTE: You can install multiple plugins at once
  vim.pack.add(telescope_plugins)

  -- See `:help telescope` and `:help telescope.setup()`
  require("telescope").setup({
    -- You can put your default mappings / updates / etc. in here
    --  All the info you're looking for is in `:help telescope.setup()`
    --
    -- defaults = {
    --   mappings = {
    --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
    --   },
    -- },
    -- pickers = {}
    extensions = {
      ["ui-select"] = { require("telescope.themes").get_dropdown() },
    },
  })

  -- Enable Telescope extensions if they are installed
  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "ui-select")

  -- See `:help telescope.builtin`
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
  vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
  vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
  vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
  vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
  vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
  vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
  vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
  vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

  vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[Project] [Files]" })
  vim.keymap.set("n", "<C-p>", builtin.git_files, {})
  vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
  end)

  -- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
  -- If you later switch picker plugins, this is where to update these mappings.
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
    callback = function(event)
      local buf = event.buf

      -- Find references for the word under your cursor.
      vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

      -- Jump to the implementation of the word under your cursor.
      -- Useful when your language has ways of declaring types without an actual implementation.
      vim.keymap.set("n", "gri", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })

      -- Jump to the definition of the word under your cursor.
      -- This is where a variable was first declared, or where a function is defined, etc.
      -- To jump back, press <C-t>.
      vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

      -- Fuzzy find all the symbols in your current document.
      -- Symbols are things like variables, functions, types, etc.
      vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })

      -- Fuzzy find all the symbols in your current workspace.
      -- Similar to document symbols, except searches over your entire project.
      vim.keymap.set(
        "n",
        "gW",
        builtin.lsp_dynamic_workspace_symbols,
        { buffer = buf, desc = "Open Workspace Symbols" }
      )

      -- Jump to the type of the word under your cursor.
      -- Useful when you're not sure what type a variable is and you want to see
      -- the definition of its *type*, not where it was *defined*.
      vim.keymap.set("n", "grt", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
    end,
  })

  -- Override default behavior and theme when searching
  vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end, { desc = "[/] Fuzzily search in current buffer" })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  vim.keymap.set("n", "<leader>s/", function()
    builtin.live_grep({
      grep_open_files = true,
      prompt_title = "Live Grep in Open Files",
    })
  end, { desc = "[S]earch [/] in Open Files" })

  -- Shortcut for searching your Neovim configuration files
  vim.keymap.set("n", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end, { desc = "[S]earch [N]eovim files" })
end

-- ============================================================
-- SECTION 5: LSP
-- LSP keymaps, server configuration, Mason tools installations
-- ============================================================
do
  -- Useful status updates for LSP.
  vim.pack.add({ gh("j-hui/fidget.nvim") })
  require("fidget").setup({})

  --  This function gets run when an LSP attaches to a particular buffer.
  --    That is to say, every time a new file is opened that is associated with
  --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
  --    function will be executed to configure the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      -- NOTE: Remember that Lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local map = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end

      -- Rename the variable under your cursor.
      --  Most Language Servers support renaming across files, etc.
      map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header.
      map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client:supports_method("textDocument/documentHighlight", event.buf) then
        local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
          end,
        })
      end

      -- The following code creates a keymap to toggle inlay hints in your
      -- code, if the language server you are using supports them
      --
      -- This may be unwanted, since they displace some of your code
      if client and client:supports_method("textDocument/inlayHint", event.buf) then
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
        end, "[T]oggle Inlay [H]ints")
      end
    end,
  })

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --  See `:help lsp-config` for information about keys and how to configure
  ---@type table<string, vim.lsp.Config>
  local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    -- ts_ls = {},

    zls = {
      settings = {
        zls = {
          enable_inlay_hints = true,
          enable_snippets = true,
          warn_style = true,
        },
      },
    },

    stylua = {}, -- Used to format Lua code

    -- Special Lua Config, as recommended by neovim help docs
    lua_ls = {
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath("config")
            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
            path = { "lua/?.lua", "lua/?/init.lua" },
          },
          workspace = {
            checkThirdParty = false,
            -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
            --  See https://github.com/neovim/nvim-lspconfig/issues/3189
            library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
              "${3rd}/luv/library",
              "${3rd}/busted/library",
            }),
          },
        })
      end,
      ---@type lspconfig.settings.lua_ls
      settings = {
        Lua = {
          format = { enable = false }, -- Disable formatting (formatting is done by stylua)
        },
      },
    },

    omnisharp = {},
  }

  vim.pack.add({
    gh("neovim/nvim-lspconfig"),
    gh("mason-org/mason.nvim"),
    gh("mason-org/mason-lspconfig.nvim"),
    gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
  })

  -- Automatically install LSPs and related tools to stdpath for Neovim
  require("mason").setup({})

  -- Ensure the servers and tools above are installed
  --
  -- To check the current status of installed tools and/or manually install
  -- other tools, you can run
  --    :Mason
  --
  -- You can press `g?` for help in this menu.
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    -- You can add other tools here that you want Mason to install
  })

  require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

  for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
  end
end

-- ============================================================
-- SECTION 6: FORMATTING
-- conform.nvim setup and keymap
-- ============================================================
do
  -- [[ Formatting ]]
  vim.pack.add({ gh("stevearc/conform.nvim") })
  require("conform").setup({
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- You can specify filetypes to autoformat on save here:
      local enabled_filetypes = {
        -- lua = false,
        -- python = true,
      }
      if enabled_filetypes[vim.bo[bufnr].filetype] then
        return { timeout_ms = 500 }
      else
        return nil
      end
    end,
    default_format_opts = {
      lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
    },
    -- You can also specify external formatters in here.
    formatters_by_ft = {
      -- rust = { 'rustfmt' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
    },
    formatters = {
      stylua = {
        prepend_args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") },
      },
    },
  })

  vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true })
  end, { desc = "[F]ormat buffer" })
end

-- ============================================================
-- SECTION 7: AUTOCOMPLETE & SNIPPETS
-- blink.cmp and luasnip setup
-- ============================================================
do
  -- [[ Snippet Engine ]]

  -- NOTE: You can also specify plugin using a version range for its git tag.
  --  See `:help vim.version.range()` for more info
  vim.pack.add({ { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2.*") } })
  require("luasnip").setup({})

  -- `friendly-snippets` contains a variety of premade snippets.
  --    See the README about individual language/framework/plugin snippets:
  --    https://github.com/rafamadriz/friendly-snippets
  --
  -- vim.pack.add { gh 'rafamadriz/friendly-snippets' }
  -- require('luasnip.loaders.from_vscode').lazy_load()
  --

  vim.pack.add({ gh("mbbill/undotree") })

  vim.pack.add({ gh("nvim-treesitter/nvim-treesitter-context") })
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false, -- Enable multiwindow support.
    max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  })

  -- [[ Autocomplete Engine ]]
  vim.pack.add({ { src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") } })
  require("blink.cmp").setup({
    keymap = {
      -- 'default' (recommended) for mappings similar to built-in completions
      --   <c-y> to accept ([y]es) the completion.
      --    This will auto-import if your LSP supports it.
      --    This will expand snippets if the LSP sent a snippet.
      -- 'super-tab' for tab to accept
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- For an understanding of why the 'default' preset is recommended,
      -- you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      --
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See `:help blink-cmp-config-keymap` for defining your own keymap
      preset = "default",

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { "lsp", "path", "snippets" },
    },

    snippets = { preset = "luasnip" },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See `:help blink-cmp-config-fuzzy` for more information
    fuzzy = { implementation = "lua" },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  })
end

-- ============================================================
-- SECTION 8: TREESITTER
-- Parser installation, syntax highlighting, folds, indentation
-- ============================================================
do
  -- [[ Configure Treesitter ]]
  --  Used to highlight, edit, and navigate code
  --
  --  See `:help nvim-treesitter-intro`

  -- NOTE: You can also specify a branch or a specific commit
  vim.pack.add({ { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" } })

  -- Ensure basic parsers are installed

  local parsers =
    { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc" }

  require("nvim-treesitter").install(parsers)

  ---@param buf integer
  ---@param language string
  local function treesitter_try_attach(buf, language)
    -- Check if a parser exists and load it
    if not vim.treesitter.language.add(language) then
      return
    end
    -- Enable syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- Enable treesitter based folds
    -- For more info on folds see `:help folds`
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'

    -- Check if treesitter indentation is available for this language, and if so enable it
    -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
    local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil

    -- Enable treesitter based indentation
    if has_indent_query then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end

  local available_parsers = require("nvim-treesitter").get_available()
  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then
        return
      end

      local installed_parsers = require("nvim-treesitter").get_installed("parsers")

      if vim.tbl_contains(installed_parsers, language) then
        -- Enable the parser if it is already installed
        treesitter_try_attach(buf, language)
      elseif vim.tbl_contains(available_parsers, language) then
        -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
        require("nvim-treesitter").install(language):await(function()
          treesitter_try_attach(buf, language)
        end)
      else
        -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
        treesitter_try_attach(buf, language)
      end
    end,
  })
end

-- ============================================================
-- SECTION 9: OPTIONAL EXAMPLES / NEXT STEPS
-- kickstart.plugins.* examples
-- ============================================================
do
  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug'
  -- require 'kickstart.plugins.indent_line'
  -- require 'kickstart.plugins.lint'
  -- require 'kickstart.plugins.autopairs'
  -- require 'kickstart.plugins.neo-tree'
  -- require 'kickstart.plugins.gitsigns' -- adds gitsigns recommended keymaps

  -- NOTE: You can add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- require 'custom.plugins'
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
