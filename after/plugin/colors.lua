function ColorMe()
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- test
	vim.api.nvim_set_hl(0, "Comment", { fg = "#ff7ac6" })
  -- vim.api.nvim_set_hl(0, "Normal", { fg = "#000000" })

  -- this will remove the vim background to reveal the terminal background
  -- if the terminal background is opaque, the user will not see to the desktop

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end
print("color successful")
ColorMe()
