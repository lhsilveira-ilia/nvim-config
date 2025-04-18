vim.g.mapleader = " "

local set = vim.keymap.set;

set('v', '<leader>y', '"+y', { desc = "Yank to clipboard" })
set('n', '<leader>y', '"+y', { desc = "Yank to clipboard" })
set('n', '<leader>Y', '"+yg_', { desc = "Yank remaining to end of line to clipboard" })
set('n', '<leader>yy', '"+yy', { desc = "Yank the entire line to clipboard" })

set('n', '<leader>w', ':w<CR>', { desc = "Write buffer (Save file)" })
set('n', '<C-s>', ':w<CR>', { desc = "Write buffer (Save file)" })
set('n', '<C-S-S>', ':waCR>', { desc = "Write all buffers (Save all files)" })
set('n', '<leader>W', ':wbd<CR>', { desc = "Write buffer and close it" })
set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open NeoVim builtin file explorer" })

-- keymap set in bufdelete plugin
-- set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line down" })

set("n", "<C-d>", "<C-d>zz", { desc = "Page up and centralize line" })
set("n", "<C-u>", "<C-u>zz", { desc = "Page down and centralize line" })

set("x", "<leader>dp", '"_dp', { desc = "Cut to the void replacing it with current yank" })
set({ "v", "n" }, "<leader>d", '"_d', { desc = "Cut to the void (Delete without copying)" })
set("n", "<leader>dp", '"_ddp', { desc = "Cut line to the void (Delete line without copying)" })
set("n", "<leader>dd", '"_dd', { desc = "Cut line to the void replacing it with current yank" })

set("n", "Q", "<nop>", { desc = "DISABLED: Close NeoVim" })

set("i", "<C-c>", "<Esc>")

set("n", '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set("n", ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set("n", 'ld', vim.diagnostic.open_float, { desc = 'Show [L]SP [D]iagnostic messages in a popup' })
set("n", 'lq', vim.diagnostic.setloclist, { desc = 'Open [L]SP diagnostic [Q]uickfix list' })

set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")
