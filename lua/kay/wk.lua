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
	["e"] = { "<CMD>NvimTreeToggle<cr>", "File Explorer" },
	["r"] = { "<CMD>lua require('spectre').open_file_search()<CR>", "Spectre" },
	["w"] = { "<CMD>w!<CR>", "Save File" },
	["q"] = { "<CMD>qa<CR>", "Quit IDE" },
	["s"] = { "<CMD>lua vim.lsp.buf.format()<CR><CMD>w<CR>", "Save & Format" },
	["c"] = { "<CMD>BufDel<CR>", "Close Buffer" },
	["f"] = {
		"<CMD>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["g"] = { "<CMD>Telescope live_grep theme=ivy<CR>", "Find In Current Folder" },
	["h"] = { "<CMD>Telescope current_buffer_fuzzy_find theme=ivy<CR>", "Find In Current File" },
	["l"] = { "<CMD>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", "Show Diagnostic Float" },
	["a"] = { "<CMD>Telescope media_files<CR>", "Find Media Files" },
	d = {
		name = "LSP",
		d = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Information" },
		f = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Definition" },
		g = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		h = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		l = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
	j = {
		name = "Telescope",
		a = { "<CMD>Telescope git_branches<cr>", "Checkout Branch" },
		s = { "<CMD>Telescope spell_suggest<cr>", "Spell" },
		d = { "<CMD>Telescope treesitter<cr>", "Treesitter" },
		f = { "<CMD>Telescope colorscheme<cr>", "Colorscheme" },
		g = { "<CMD>Telescope help_tags<cr>", "Find Help" },
		h = { "<CMD>Telescope man_pages<cr>", "Man Pages" },
		j = { "<CMD>Telescope oldfiles<cr>", "Open Recent File" },
		k = { "<CMD>Telescope registers<cr>", "Registers" },
		l = { "<CMD>Telescope keymaps<cr>", "Keymaps" },
		m = { "<CMD>Telescope commands<cr>", "Commands" },
		n = { "<CMD>Telescope lsp_references<cr>", "LSP References" },
		b = { "<CMD>Telescope git_commits<cr>", "Git Commits Diff" },
		v = { "<CMD>Telescope git_bcommits<cr>", "Git Commits Diff Current Buf" },
		c = { "<CMD>Telescope software-licenses find<cr>", "Software Licenses" },
		x = { "<CMD>Telescope emoji<cr>", "Emoji" },
	},
}

wk.setup(setup)
wk.register(mappings, opts)
