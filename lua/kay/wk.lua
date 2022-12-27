local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

local setup = {
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	["e"] = { "<CMD>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<CMD>w!<CR>", "Save" },
	["q"] = { "<CMD>qa<CR>", "Quit" },
	["s"] = { "<CMD>lua vim.lsp.buf.format()<CR><CMD>w<CR>", "Save & Format" },
	["c"] = { "<CMD>BufDel<CR>", "Close Buffer" },
	["f"] = {
		"<CMD>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["g"] = { "<CMD>Telescope live_grep theme=ivy<CR>", "Grep Folder" },
	["h"] = { "<CMD>Telescope current_buffer_fuzzy_find theme=ivy<CR>", "Grep File" },
	["o"] = { "<CMD>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "Show LSP" },
	["u"] = { "<CMD>Telescope grep_string<CR>", "Find word" },
	["p"] = { "<CMD>Telescope media_files<CR>", "Find word" },
	j = {
		name = "Search",
		b = { "<CMD>Telescope git_branches<cr>", "Checkout branch" },
		s = { "<CMD>Telescope spell_suggest<cr>", "Spell" },
		a = { "<CMD>Telescope treesitter<cr>", "Treesitter" },
		c = { "<CMD>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<CMD>Telescope help_tags<cr>", "Find Help" },
		M = { "<CMD>Telescope man_pages<cr>", "Man Pages" },
		r = { "<CMD>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<CMD>Telescope registers<cr>", "Registers" },
		k = { "<CMD>Telescope keymaps<cr>", "Keymaps" },
		C = { "<CMD>Telescope commands<cr>", "Commands" },
	},
}

wk.setup(setup)
wk.register(mappings, opts)
