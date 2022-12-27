local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<CMD>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize -2<CR>", opts)
keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-h>", "<CMD>bprevious<CR>", opts)

-- Close tab
keymap("n", "<leader>c", "<CMD>BufDel<CR>", opts)

-- Explorer
keymap("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", opts)

-- Save format
keymap("n", "<leader>s", "<CMD>lua vim.lsp.buf.format()<CR><CMD>w<CR>", opts)

-- Quit
keymap("n", "<leader>q", "<CMD>qa<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<CMD>Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>g", "<CMD>Telescope live_grep<CR>", opts)

-- Lsp
keymap("n", "<leader>l", "<CMD>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", opts)
