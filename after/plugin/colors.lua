function ColorMe()
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- test
	vim.api.nvim_set_hl(0, "Comment", { fg = "#ff7ac6" })
    -- vim.api.nvim_set_hl(0, "Normal", { fg = "#000000" })
end
print("color successful")
ColorMe()
