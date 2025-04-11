vim.g.mapleader = " "

local set = vim.keymap.set;

set('v', '<leader>y', '"+y')
set('n', '<leader>y', '"+y')
set('n', '<leader>Y', '"+yg_')
set('n', '<leader>yy', '"+yy')

set('n', '<leader>w', ':w<CR>')
set('n', '<leader>W', ':wbd<CR>')
set("n", "<leader>ex", vim.cmd.Ex)
set("n", "<leader>q", ":bd<CR>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("x", "<leader>p", '"_dP')
set("v", "<leader>d", '"_d')
set("n", "<leader>d", '"_d')
set("n", "<leader>dd", '"_dd')

set("n", "Q", "<nop>")

set("i", "<C-c>", "<Esc>")

set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")
