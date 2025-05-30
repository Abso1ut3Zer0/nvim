--, builtin.find_files, {}This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	use "nvim-lua/plenary.nvim"

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.2",
		-- or                            , branch = "0.1.x",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use "rebelot/kanagawa.nvim"
	use("theprimeagen/git-worktree.nvim")


	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
	use("theprimeagen/harpoon")
	use("mbbill/undotree")

	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("tpope/vim-fugitive")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-dadbod")
	use("jpalardy/vim-slime")
	use("lervag/vimtex")

	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{                                      -- Optional
			"williamboman/mason.nvim",
			run = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
			},
			{"williamboman/mason-lspconfig.nvim"}, -- Optional

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},     -- Required
			{"hrsh7th/cmp-nvim-lsp"}, -- Required
			{"L3MON4D3/LuaSnip"},     -- Required
		}
	}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}

	use {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	}

	require("mason").setup()
	require("mason-lspconfig").setup()

end)

