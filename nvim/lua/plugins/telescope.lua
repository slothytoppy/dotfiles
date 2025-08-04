-- init.lua:
-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  tag = '0.1.5',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
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
  end
}
