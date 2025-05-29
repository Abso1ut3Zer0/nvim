require('diffview').setup({
	enhanced_diff_hl = true,
	use_icons = true,
	icons = {
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
	},
	file_panel = {
		win_config = {
			position = "left",
			width = 35,
		},
		listing_style = "tree",
	},
})

-- Key mappings for Diffview (prefixed with 'd' for 'Diff')
vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>df', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
