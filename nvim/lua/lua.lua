vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "<leader>vrr", "<cmd> lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ph", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>ps", function()
    require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep String > "),
    })
end)
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<CR>")
