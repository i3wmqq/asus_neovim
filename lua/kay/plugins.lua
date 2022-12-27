local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	-- Dashboard
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })
	-- Blankline
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	-- Theme
	use({ "folke/tokyonight.nvim", commit = "2c2287db18732c30dba6b28d95c9a62481fdbc41" })
	-- Auto close bracket
	use({ "windwp/nvim-autopairs", commit = "03580d758231956d33c8dd91e2be195106a79fa4" })

	-- Auto complete
	use({ "hrsh7th/nvim-cmp", commit = "a9c701fa7e12e9257b3162000e5288a75d280c28" })
	use({ "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" })
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" })
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" })
	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "42ca8ce0f2252be795da4789fadfa91f6c3f7464" })
	use({ "williamboman/mason.nvim", commit = "21a2475da458e97be798bdc9261da24460da5c65" })
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "27f61f75a71bb3c2504a17e02b571f79cae43676" })
	-- Snippet
	use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" })
	use({ "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" })
	use({ "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" })

	-- Icon
	use({ "onsails/lspkind.nvim", commit = "c68b3a003483cf382428a43035079f78474cd11e" })
	use({ "kyazdani42/nvim-web-devicons", commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" })
	-- Format
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" })
	-- Syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", commit = "7c9ddb72d198d45895d73bc7495e1b7e9627f6ca" })
	-- Git change
	use({ "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" })

	-- Packer manage itsefl and dependencies
	use({ "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" })
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" })

	-- Delete buffer
	use({ "ojroques/nvim-bufdel", commit = "a60b3531e5bd56f8602acb4ba7f5b2eeb782d54b" })
	-- Tab
	use({ "akinsho/bufferline.nvim", commit = "c7492a76ce8218e3335f027af44930576b561013" })
	-- File Explorer
	use({ "kyazdani42/nvim-tree.lua", commit = "9e4c39572f631bb60ee15cb9d46e1daa9927a45e" })
	-- Color
	use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })
	-- Status bar
	use({ "nvim-lualine/lualine.nvim", commit = "fffbcb829288c3ca366f17cdb8d46aefb5c1d6f3" })
	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "e960efa60e97df58e089b00270f09d60f27202c8" })
	-- Comment
	use({ "numToStr/Comment.nvim", commit = "45dc21a71ad1450606f5e98261badb28db59d74c" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
