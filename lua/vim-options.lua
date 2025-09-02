vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>fq", ":q!<CR>")

-- Navigate vim panes better
vim.keymap.set('n', '<C-k', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l', ':wincmd l<CR>')

vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>")
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

-- Set highlight on search, but clear on pressing <ESC> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Disable arrow keys
for _, mode in ipairs({ 'n', 'i', 'v' }) do
  vim.keymap.set(mode, '<Up>', '<ESC>:echoe "Use k"<CR>')
  vim.keymap.set(mode, '<Down>', '<ESC>:echoe "Use j"<CR>')
  vim.keymap.set(mode, '<Right>', '<ESC>:echoe "Use l"<CR>')
  vim.keymap.set(mode, '<Left>', '<ESC>:echoe "Use h"<CR>')
end

-- Setup keymap for Oil


-- Set jk as Esc in insert mode until I find a better alternative
vim.keymap.set('i', 'jk', '<ESC>')
vim.o.timeout = true
vim.o.timeoutlen = 250


