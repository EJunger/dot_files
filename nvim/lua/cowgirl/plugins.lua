return require("packer").startup(function()
	-- package manager
	use({
		"wbthomason/packer.nvim",
		opt = false,
	})
	-- ===========================
	-- Spacemacs babyyyy
	use("colepeters/spacemacs-theme.vim")
	-- icons
	use("kyazdani42/nvim-web-devicons")
	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	-- bufferline
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- ===========================
	-- treesitting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- treesitter addons
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    use("windwp/nvim-ts-autotag")
	-- ===========================
	-- comments
	use("preservim/nerdcommenter")
	-- bracket pairs
	use("windwp/nvim-autopairs")
	-- ===========================
	-- tree navigator
	use("kyazdani42/nvim-tree.lua")
	-- ===========================
	-- lspen15s
	use("neovim/nvim-lspconfig")
    -- lsp ext
    use("nvim-lua/lsp_extensions.nvim")
	-- lsp icons
	use("onsails/lspkind-nvim")
	-- cmp engine
	use("hrsh7th/nvim-cmp")
	-- cmp tools
	use("hrsh7th/cmp-nvim-lsp")
	-- snipsnip
    --use("hrsh7th/cmp-vsnip")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
	-- nav cmp
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	-- formatting
	--use("jose-elias-alvarez/null-ls.nvim")
    -- tabnine?
    --use("tzachar/cmp-tabnine", { run = "./install.sh" })
	-- ===========================
	-- lsp installer
	--use("williamboman/nvim-lsp-installer")
	-- ===========================
    -- DAP
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("jbyuki/one-small-step-for-vimkind")
	-- ===========================
    -- toggleterm
    use("akinsho/toggleterm.nvim")
	-- ===========================
    -- git
    use("TimUntersberger/neogit")
    --use("kdheepak/lazygit.nvim")
	-- ===========================
	-- telescope prereqs
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("BurntSushi/ripgrep")
	-- scopedaddy
	use("nvim-telescope/telescope.nvim")
	-- scopedaddy toys
	use("nvim-telescope/telescope-file-browser.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
    -- dap
    use("nvim-telescope/telescope-dap.nvim")
	-- most based harpoon
	use("ThePrimeagen/harpoon")
    -- code actions
    use("nvim-telescope/telescope-ui-select.nvim")
	-- ===========================
	-- tmux nav
	use("christoomey/vim-tmux-navigator")
	-- ===========================
	-- lang server utils
	use("simrat39/rust-tools.nvim")
end)
