local g = vim.g
local o = vim.o

-- cmd('syntax on')
vim.api.nvim_command('filetype plugin indent on')

vim.opt.termguicolors = true

-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true
-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = "yes:2"
-- o.cursorline = true

-- Better editing experience
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true
-- o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
-- o.list = true
-- o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = "view"
-- Stable buffer content on window open/close events.
o.splitkeep = "screen"

-- Improve diff
vim.opt.diffopt:append("linematch:60")

-- Smooth scrolling
o.smoothscroll = true

-- WARN: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.keymap.set("n", "<c-f>", ":silent !tmux neww session-deez<cr>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    { import = "plugins" },
  }
})
require("keys")
require("lazygit")

vim.cmd 'packadd termdebug'

local current_os = vim.loop.os_uname().sysname
if current_os == 'Linux' then
  vim.g.termdebugger = 'gdb'
end

local function debug_in_tab()
  local path = vim.fn.input('path: ', '', 'file')
  vim.cmd('Termdebug ' .. path)
  vim.cmd 'Program'
  local buf = vim.api.nvim_get_current_buf()
  vim.cmd.tabnew()
  vim.api.nvim_set_current_buf(buf)
  vim.cmd.tabprevious()
  vim.cmd 'Program'
  vim.cmd.wincmd 'c'
end

vim.api.nvim_create_user_command('DebugInTab', debug_in_tab, {})

vim.keymap.set('n', '<leader>dt', function() vim.cmd 'DebugInTab' end)
vim.keymap.set('n', '<leader>dD', function() vim.cmd 'Debug' end)
vim.keymap.set('n', '<leader>db', function() vim.cmd 'Break' end)
vim.keymap.set('n', '<leader>do', function() vim.cmd 'Over' end)
vim.keymap.set('n', '<leader>ds', function() vim.cmd 'Step' end)
vim.keymap.set('n', '<leader>dS', function() vim.cmd 'Stop' end)
