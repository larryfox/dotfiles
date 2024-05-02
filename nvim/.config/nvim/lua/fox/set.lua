vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.cmd.syntax "off"
vim.opt.termguicolors = true
vim.opt.background = "light"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 5
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 500

vim.opt.colorcolumn = "80"
vim.opt.tabstop = 4

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
