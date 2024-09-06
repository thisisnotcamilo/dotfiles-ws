-- imports
require('plugins')

-- global settings
local api = vim.api

-- remap leader to space
vim.g.mapleader = " "

-- theme
vim.cmd [[colorscheme moonfly]]

-- enable mouse scroll
vim.cmd [[set mouse=a]]

-- disable swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.clipboard = "unnamedplus"

vim.wo.relativenumber = true
vim.wo.number = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.ignorecase = true

vim.opt.smartindent = false

vim.o.scrolloff = 10
vim.o.sidescrolloff = 15
vim.o.sidescroll = 1

-- keybinds
-- remap j and k to move across display lines and not real lines
api.nvim_set_keymap("n", "k", "gk", {noremap = true})
api.nvim_set_keymap("n", "gk", "k", {noremap = true})
api.nvim_set_keymap("n", "j", "gj", {noremap = true})
api.nvim_set_keymap("n", "gj", "j", {noremap = true})

-- copy
api.nvim_set_keymap("n", "<C-c>", "y", {noremap=true, silent=true})

-- save
api.nvim_set_keymap("n", "<C-s>", ":w!<CR>", {noremap=true, silent=true})

-- quit
api.nvim_set_keymap("n", "<leader>w", ":bd!<CR>", {noremap=true, silent=true})

-- next buffer
api.nvim_set_keymap("n", "<leader>l", ":bn<CR>", {noremap = true, silent = true})

-- previous buffer
api.nvim_set_keymap("n", "<leader>h", ":bp<CR>", {noremap = true, silent = true})

-- clear hightlight
api.nvim_set_keymap("n", "C-l", ":<C-u>noh<CR><C-l>", {noremap = true, silent = true})

-- find file
api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", {noremap = true, silent = true})
-- find file in git
api.nvim_set_keymap("n", "<leader>g", ":Telescope git_files<CR>", {noremap = true, silent = true})
-- grep inside files (ripgrep required for this to work)
api.nvim_set_keymap("n", "<leader>v", ":Telescope live_grep<CR>", {noremap = true, silent = true})

-- amazing remaps stolen from ThePrimeagen
api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, silent = true})
api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true, silent = true})
api.nvim_set_keymap("n", "<C-f>", "<C-f>zz", {noremap = true, silent = true})
api.nvim_set_keymap("n", "<C-b>", "<C-b>zz", {noremap = true, silent = true})
api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true, silent = true})
api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true, silent = true})

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "yaml", "c", "cpp", "lua", "python", "javascript", "go" },
  sync_install = false,

  -- this is to avoid a bug on md files and get highlight working
  highlight = {
    enable = true,
    disable = { 'markdown' },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
}

-- nvim-bufferline
vim.opt.termguicolors = true
require("bufferline").setup {}

-- nvim-telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {}
    }
  },
  pickers = {
  },
  extensions = {
    require("telescope").load_extension "file_browser",
  }
}
