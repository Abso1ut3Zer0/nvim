require('neorg')

-- Navigation to and from notes
vim.keymap.set("n", "<leader>nr", ":Neorg return<CR>")
vim.keymap.set("n", "<leader>n1", ":Neorg workspace notes<CR>")
vim.keymap.set("n", "<leader>n2", ":Neorg workspace fc_tracker<CR>")
vim.keymap.set("n", "<leader>n3", ":Neorg workspace fcshield_tracker<CR>")
