--- LSP
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gr", "<cmd> lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set("n", "<leader>ds", "<cmd>DiagnosticsToggleVirtualText<cr>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end)

vim.api.nvim_create_user_command(
  'DiagnosticsToggleVirtualText',
  function()
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
      vim.diagnostic.config({ virtual_text = false })
    else
      vim.diagnostic.config({ virtual_text = true })
    end
  end,
  {}
)

-- Command to toggle diagnostics
vim.api.nvim_create_user_command(
  'DiagnosticsToggle',
  function()
    local current_value = not vim.diagnostic.is_enabled()
    if current_value then
      vim.diagnostic.enable()
    else
      vim.diagnostic.enable(false)
    end
  end,
  {}
)

--- LSP END

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ph", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>ps", function()
  require("telescope.builtin").grep_string({
    search = vim.fn.input("Grep String > "),
  })
end)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fk", builtin.keymaps)

local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    if io.open(item.value, "r") then
      table.insert(file_paths, item.value)
    end
  end

  require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      })
      :find()
end

vim.keymap.set("n", "<C-e>", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

local function open_gitui()
  local buf = vim.api.nvim_create_buf(false, true)
  local height = math.floor(vim.o.lines * 0.7)
  local width = math.floor(vim.o.columns * 0.9)
  local row = math.floor(vim.o.lines - height) / 2
  local col = math.floor(vim.o.columns - width) / 2

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    height = height,
    width = width,
    row = row,
    col = col,
    style = 'minimal',
  })

  vim.fn.termopen('gitui', {
    on_exit = function() vim.api.nvim_win_close(win, true) end,
  })

  vim.cmd.startinsert()
end

vim.api.nvim_create_user_command('GituiStart', open_gitui, {})
vim.keymap.set('n', '<leader>gs', function() vim.cmd 'GituiStart' end)
