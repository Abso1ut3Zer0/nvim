require('neorg')

-- Navigation to and from notes
vim.keymap.set("n", "<leader>nr", ":Neorg return<CR>")
vim.keymap.set("n", "<leader>n1", ":Neorg workspace notes<CR>")
vim.keymap.set("n", "<leader>n2", ":Neorg workspace fc_tracker<CR>")
vim.keymap.set("n", "<leader>n3", ":Neorg workspace fcshield_tracker<CR>")

-- Export to markdown in project tracker
vim.keymap.set("n", "<leader>nx2", ":Neorg export to-file ~/fc_tracker/status.md<CR>")
vim.keymap.set("n", "<leader>nx3", ":Neorg export to-file ~/fcshield_tracker/status.md<CR>")
