return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "lua_ls",
      "rust_analyzer",
      "nil_ls",
      "nu",
    })

    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    vim.keymap.set("n", "gr", "<cmd> lua vim.lsp.buf.references()<cr>")
    vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    vim.keymap.set("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")
    vim.keymap.set("n", "<leader>ds", "<cmd>DiagnosticsToggleVirtualText<cr>")
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end)

    vim.keymap.set('n', '<leader>d', "<cmd>Telescope diagnostics<CR>")
  end,
}
