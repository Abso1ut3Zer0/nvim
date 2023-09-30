require('kanagawa').setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = { italic = true },
	keywordStyle = { bold = true },
	statementStyle = {bold = true },
	typeStyle = { bold = true },
	transparent = false,
	dimInactive = false,
	terminalColors = false,
	colors = {
		palette = {},
		theme = {
			wave = {},
			lotus = {},
			dragon = {
				syn = {
					string = "#87b887",
					number = "#ff9cb4",
					constant = "#d8927b",
					identifier = "#d4bd8d",
					fun = "#d1b9b3",
					statement = "#d46767",
					keyword = "#8992a7",
					operator = "#b2a09c",
					puct = "#b2a09c",
					comment = "#b2a09c",
					preproc = "#d08770",
					type = "#8ab2e3",
					special1 = "#d46767",
					special2 = "#d46767",
					special3 = "#d46767",
				},
			},
		all = { ui = { bg_gutter = "none" } } },
	},
	overrides = function(colors)
		return {}
	end,
	theme = "wave",
	background = {
		dark = "dragon",
		light = "lotus"
	},
})

vim.cmd('colorscheme kanagawa')

