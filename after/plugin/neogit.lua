local neogit = require('neogit')

neogit.setup({
	-- Disable default keymaps to avoid conflicts
	disable_signs = false,
	disable_hint = false,
	disable_context_highlighting = false,

	-- Customize displayed signs
	signs = {
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},

	-- Integration with diffview
	integrations = {
		diffview = true,
	},

	-- Open neogit in a new tab by default
	kind = "tab",

	-- Automatically refresh status when a file is saved
	auto_refresh = true,

	-- Status colors
	status = {
		recent_commit_count = 30,
	},

	-- Customize sections
	sections = {
		untracked = { folded = true, hidden = false },
		unstaged = { folded = false, hidden = false },
		staged = { folded = false, hidden = false },
		stashes = { folded = true, hidden = false },
		unpulled = { folded = true, hidden = false },
		unmerged = { folded = false, hidden = false },
		recent = { folded = false, hidden = false },
	},
})

-- Key mappings for Neogit (prefixed with 'n' for 'Neogit')
vim.keymap.set('n', '<leader>ng', function() neogit.open() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nc', function() neogit.open({ "commit" }) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nb', function() neogit.open({ "branch" }) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nl', function() neogit.open({ "log" }) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>np', function() neogit.open({ "pull" }) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nP', function() neogit.open({ "push" }) end, { noremap = true, silent = true })
