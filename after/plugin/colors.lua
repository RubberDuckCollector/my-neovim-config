function ColorMe()
  -- color = color or "kanagawa"
  color = color or "catppuccin"
  -- color = color or "tokyonight"
  -- color = color or "space_vim_theme"
  -- color = color or "matrix"
  vim.cmd.colorscheme(color)

  -- test
  -- vim.api.nvim_set_hl(0, "Comment", { fg = "#ff7ac6" })

  -- black text
  -- vim.api.nvim_set_hl(0, "Normal", { fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "Normal", { fg = "#222222" })

  -- this will remove the vim background to reveal the terminal background
  -- if the terminal background is opaque, the user will not see to the desktop

  -- vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#ff73ea" })
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- print("color successful")
ColorMe()
