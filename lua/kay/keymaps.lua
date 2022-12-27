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
