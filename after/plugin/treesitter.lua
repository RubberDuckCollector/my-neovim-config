require 'nvim-treesitter.configs'.setup {

  ensure_installed = { "c", "cpp", "c_sharp", "ruby", "javascript", "typescript", "rust", "lua", "vim", "vimdoc", "query" },

  sync_install = false,
  enable = true,

  indent = {
    enable = true,
    disable = {
      "python",
    },

  },

  autotag = {
    enable = true,
    filetypes = { "html" }
  },

  auto_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages

    -- i think this has to be false for a plugin
    -- additional_vim_regex_highlighting = false,

    additional_vim_regex_highlighting = { "python" },
  },
}
