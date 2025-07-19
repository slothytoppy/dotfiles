---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  single_file_support = true,
  root_markers = { ".git" },
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy", extraArgs = { "--tests" } },
      cargo = { allFeatures = true },
      rustfmt = { extraArgs = { "+nightly" } },
      inlayHints = {
        chainingHints = { enable = false },
      },
    },
  },
}
