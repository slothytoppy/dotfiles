return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "c",
        "markdown",
        "rust",
        "nu",
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
  end
}
