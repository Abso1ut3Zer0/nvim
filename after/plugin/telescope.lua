require('telescope').setup()
require("telescope").load_extension "file_browser"
local builtin = require('telescope.builtin')

-- File browser
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<CR>', {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})

-- LSP symbols in current document
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})

-- LSP symbols in workspace
vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})

-- Recently opened files
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})

-- Git commands
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
