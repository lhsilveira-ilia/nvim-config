vim.opt.nu = true
vim.opt.relativenumber = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.laststatus = 3

vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

vim.opt.updatetime = 250
vim.opt.confirm = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.colorcolumn = "80"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldenable = false

vim.g.mapleader = " "
