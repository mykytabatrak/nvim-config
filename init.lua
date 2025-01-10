-- Indent
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use OS clipboard
vim.opt.clipboard = "unnamedplus"

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse
vim.opt.mouse = "a"

-- Hide default mode display
vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep sign column on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- White space characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Substitution preview
vim.opt.inccommand = "split"

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Highlight cursor line
vim.opt.cursorline = true

-- Cursor view padding
vim.opt.scrolloff = 10

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Source file or line(s)
vim.keymap.set(
  "n",
  "<leader><leader>sf",
  "<cmd>source %<CR>",
  { desc = "[S]ource [F]ile" }
)
vim.keymap.set(
  "n",
  "<leader><leader>sl",
  ":.lua<CR>",
  { desc = "[S]ource [L]ine" }
)
vim.keymap.set(
  "v",
  "<leader><leader>ss",
  ":lua<CR>",
  { desc = "[S]ource [S]election" }
)

local function highlight_on_yank()
  vim.highlight.on_yank({ timeout = 1000 })
end
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked range",
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = highlight_on_yank,
})

require("config.lazy")
