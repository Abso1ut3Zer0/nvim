local telescope = require("telescope")
local worktree = require("git-worktree")

worktree.setup()
telescope.load_extension("git_worktree")

vim.keymap.set("n", "<leader>ts", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>")
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>")
