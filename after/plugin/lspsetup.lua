local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr}

	vim.keymap.set({'n'}, '<leader>fm', function()
		vim.lsp.buf.format({async = false, timeout_ms = 5000})
	end, opts)
end)

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'tsserver',
    'eslint',
    'rust_analyzer',
    'clangd',
    'gopls',
	'elixirls',
    'lua_ls',
	'pylsp',
    'solang',
    'sqlls',
})

lsp.setup({
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        maxLineLength = 120,
                    },
                },
            },
        },
    },
})


-- Add the nvim-cmp configuration below
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` support, replace the following line
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
})

-- Keybinding to close the quickFix window after using something like <leader>gr (get reference)
vim.api.nvim_set_keymap('n', '<leader>qr', ':cclose<CR>', {noremap = true, silent = true})

-- Keybinding to rename something like a variable, struct, class, function, etc.
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})

-- Code action for whole file
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})

-- Code action for a range, such as highlighted scope
vim.api.nvim_set_keymap('v', '<leader>,', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', {noremap = true, silent = true})

-- Change signature (assuming a custom function 'change_signature' is implemented to handle the signature change)
vim.api.nvim_set_keymap('n', '<leader>cs', '<cmd>lua change_signature()<CR>', {noremap = true, silent = true})
