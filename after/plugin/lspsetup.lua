-- First, establish LSP capabilities for autocompletion
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- Reserve a space in the gutter to avoid layout shifts
vim.opt.signcolumn = 'yes'

-- Setup LSP keybindings when a server attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		-- Hover and navigation
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

		-- Actions
		vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('n', '<leader>qr', ':cclose<CR>', opts)
		vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.keymap.set('n', '<leader>,', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

		-- Diagnostics
		vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
		vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
		vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)
	end,
})

-- Configure diagnostics display
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

-- Setup diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup Mason
require('mason').setup({})

-- Setup rust_analyzer with custom settings
local rust_analyzer_settings = {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		}
	}
}

-- Configure Mason-lspconfig for server initialization
require('mason-lspconfig').setup({
	ensure_installed = {
		'eslint',
		'rust_analyzer',
		'clangd',
		'lua_ls',
		'gopls',
		'pylsp',
		'solang',
		'sqlls',
		'zls',
	},
	handlers = {
		-- Default handler for all servers
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		-- Custom handler for rust_analyzer
		['rust_analyzer'] = function()
			require('lspconfig').rust_analyzer.setup(rust_analyzer_settings)
		end,

		-- Add other custom handlers as needed
		['pylsp'] = function()
			require('lspconfig').pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								maxLineLength = 120,
							},
						},
					},
				}
			})
		end,
	}
})

-- Setup cmp
local cmp = require('cmp')
cmp.setup({
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
