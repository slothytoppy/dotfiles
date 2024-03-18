return {"nvim-treesitter/nvim-treesitter", config=function ()
  require("nvim-treesitter.configs").setup({
            ensure_installed = {
            "lua",
            "c",
            "markdown"
            },
            sync_install = false,
            highlight = {
                enable = true,
                disable = {},
            },
            indent = {
                enable = false,
                disable = {},
            },
        })
end}
