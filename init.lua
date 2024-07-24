require("custom")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.nu = true
vim.opt.guicursor = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

vim.opt.guifont = "Monaco:h12"

vim.cmd("set statusline+=%{expand('%:~:.')}") -- Adds relative file path to the status line

-- tmux command
vim.api.nvim_set_keymap('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true, silent = true })

-- text wrapping for particular filetypes
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.md", "*.txt", "*.tex"},
  callback = function()
    vim.opt_local.wrap = true
	vim.opt_local.linebreak = true
  end,
})
