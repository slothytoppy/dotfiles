return {
  "stevearc/conform.nvim",
  event = "BufEnter",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        c = { "clangd" },
        -- Use a sub-list to run only the first available formatter
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end,
}
