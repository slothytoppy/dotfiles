return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "lua_ls",
      "rust_analyzer",
      "nil_ls",
    })
  end,
}
