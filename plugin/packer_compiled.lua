-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/luna/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?.lua;/Users/luna/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?/init.lua;/Users/luna/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?.lua;/Users/luna/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/luna/.cache/nvim/packer_hererocks/2.1.1703358377/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["blackjack.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/blackjack.nvim",
    url = "https://github.com/alanfortlink/blackjack.nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  delimitMate = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kanagawa = {
    config = { "\27LJ\2\nK\0\0\3\0\5\0\a'\0\0\0007\0\1\0006\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\nstyle\twave\0" },
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/kanagawa",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tetris"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/nvim-tetris",
    url = "https://github.com/alec-gibson/nvim-tetris"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["sudoku.nvim"] = {
    commands = { "Sudoku" },
    config = { "\27LJ\2\nÕ\b\0\0\5\0,\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\16\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\0035\4\v\0>\4\b\0035\4\f\0>\4\t\0035\4\r\0>\4\n\0035\4\14\0>\4\v\0035\4\15\0>\4\f\0035\4\16\0>\4\r\0035\4\17\0>\4\14\0035\4\18\0>\4\15\3=\3\19\0025\3\21\0005\4\20\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\3=\3+\2B\0\2\1K\0\1\0\22custom_highlights\nerror\1\0\2\abg\f#843434\afg\nwhite\15set_number\1\0\2\bgui\vitalic\afg\nwhite\16same_number\1\0\2\bgui\tbold\afg\nwhite\22settings_disabled\1\0\2\bgui\vitalic\afg\f#8e8e8e\brow\1\0\2\afg\f#d5d5d5\abg\f#14151a\vcolumn\1\0\2\afg\f#d5d5d5\abg\f#14151a\vsquare\1\0\2\afg\nwhite\abg\f#292b35\14hint_cell\1\0\2\abg\vyellow\afg\nwhite\16active_menu\1\0\3\bgui\tbold\abg\nblack\afg\nwhite\vnumber\1\0\2\abg\nblack\afg\nwhite\nboard\1\0\0\1\0\1\afg\f#7d7d7d\rmappings\1\0\2\vaction\14decrement\bkey\6-\1\0\2\vaction\14increment\bkey\6+\1\0\2\vaction\tredo\bkey\n<C-r>\1\0\2\vaction\tundo\bkey\6u\1\0\2\vaction\14view=help\bkey\agh\1\0\2\vaction\rview=zen\bkey\agz\1\0\2\vaction\rview=tip\bkey\agt\1\0\2\vaction\18view=settings\bkey\ags\1\0\2\vaction\15reset_game\bkey\agr\1\0\2\vaction\rnew_game\bkey\agn\1\0\2\vaction\rinsert=9\bkey\ar9\1\0\2\vaction\rinsert=3\bkey\ar3\1\0\2\vaction\rinsert=2\bkey\ar2\1\0\2\vaction\rinsert=1\bkey\ar1\1\0\2\vaction\15clear_cell\bkey\6x\1\0\3\18persist_games\2\21persist_settings\2\21default_mappings\2\nsetup\vsudoku\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/opt/sudoku.nvim",
    url = "https://github.com/jim-fx/sudoku.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-autoSurround"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-autoSurround",
    url = "https://github.com/dapt4/vim-autoSurround"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/theprimeagen/vim-be-good"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-markdown-toc"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-snake"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-snake",
    url = "https://github.com/zyedidia/vim-snake"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/luna/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: kanagawa
time([[Config for kanagawa]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\5\0\a'\0\0\0007\0\1\0006\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\nstyle\twave\0", "config", "kanagawa")
time([[Config for kanagawa]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Sudoku', function(cmdargs)
          require('packer.load')({'sudoku.nvim'}, { cmd = 'Sudoku', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sudoku.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Sudoku ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
