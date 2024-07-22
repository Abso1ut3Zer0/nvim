vim.g.slime_target = "tmux"
vim.api.nvim_set_keymap('v', '<leader>rp', '<Plug>SlimeRegionSend', { noremap = true, silent = true })
vim.g.slime_bracketed_paste = 1
vim.g.slime_python_ipython = 0
