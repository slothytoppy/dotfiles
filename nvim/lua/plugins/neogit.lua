return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
    "echasnovski/mini.pick",         -- optional
    "folke/snacks.nvim",             -- optional
  },

  keys = {
    { "<leader>lg", "<cmd>Neogit<cr>", desc = "Opens a Git helper" }
  },

  config = function()
    function open_gitui()
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
  end,
}
