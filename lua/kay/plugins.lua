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
	use({ "folke/tokyonight.nvim", commit = "9fba0cdd05382a427dafaa2b8ebb4aba99126bc" })
	-- Auto close bracket
	use({ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" })

	-- Auto complete
	use({ "hrsh7th/nvim-cmp", commit = "e94d3489311f941788756953df23ca84f83eec95" })
	use({ "hrsh7th/cmp-cmdline", commit = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e" })
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" })
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" })
	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "2dd9e060f21eecd403736bef07ec83b73341d955" })
	use({ "williamboman/mason.nvim", commit = "9a306a6be1f4c4a94b56500e7dc7b08cd14dec70" })
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "ca4c6da43ab1f5687dc35da13dd6504acc912708" })
	-- Snippet
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" })
	use({ "L3MON4D3/LuaSnip", commit = "663d54482b11bca1ce94f56993b9f6ab485a13dc" })
	use({ "rafamadriz/friendly-snippets", commit = "fd16b4d9dc58119eeee57e9915864c4480d591fd" })

	-- Icon
	use({ "onsails/lspkind.nvim", commit = "c68b3a003483cf382428a43035079f78474cd11e" })
	use({ "kyazdani42/nvim-web-devicons", commit = "9061e2d355ecaa2b588b71a35e7a11358a7e51e1" })
	-- Format
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "643c67a296711ff40f1a4d1bec232fa20b179b90" })
	-- Syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", commit = "8fa3ec03988544232f5a2ca91fefacb4844d63ef" })
	-- Git change
	use({ "lewis6991/gitsigns.nvim", commit = "56e01cb0ea52635854e97bd2dd2587c8ebfab978" })

	-- Packer manage itsefl and dependencies
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" })
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" })

	-- Delete buffer
	use({ "ojroques/nvim-bufdel", commit = "a60b3531e5bd56f8602acb4ba7f5b2eeb782d54b" })
	-- Tab
	use({ "akinsho/bufferline.nvim", commit = "0073e32fbf391df5d83c1f4531bb0a41c85e0bec" })
	-- File Explorer
	use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" })
	-- Color
	use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })
	-- Status bar
	use({ "nvim-lualine/lualine.nvim", commit = "edca2b03c724f22bdc310eee1587b1523f31ec7c" })
	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "f174a0367b4fc7cb17710d867e25ea792311c418" })
	-- Search
	use({ "BurntSushi/ripgrep", commit = "4386b8e805e273a9795ad4e256c455c74407c949" })
	-- Comment
	use({ "numToStr/Comment.nvim", commit = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
