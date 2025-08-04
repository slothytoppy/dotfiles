return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = { { "nvim-lua/plenary.nvim" } },

  config = function()
    local harpoon = require("harpoon")
    -- REQUIRED
    harpoon:setup({})
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<leader>r", function()
      harpoon:list():remove()
    end)

    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  end
}
