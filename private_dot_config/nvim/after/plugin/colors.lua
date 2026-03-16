
function Color(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)
end

Color()
