return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  config = function()
    require("blink.cmp").setup({
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
    })

    vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
  end,
}
