-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use "rebelot/kanagawa.nvim"
	use("theprimeagen/git-worktree.nvim")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
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
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "neovim/nvim-lspconfig" },    -- Required
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },         -- Required
			{ "hrsh7th/cmp-nvim-lsp" },     -- Required
			{ "L3MON4D3/LuaSnip" },         -- Required
		}
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
	}
	use {
		"hrsh7th/cmp-buffer",
	}
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}
	use {
		'TimUntersberger/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim' -- For enhanced diff views
		}
	}
end)
