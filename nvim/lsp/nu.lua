return {
  cmd = { "nu", "--lsp" },

  filetypes = { "nu" },

  root_dir = function(bufnr, on_dir)
    if not vim.fn.bufname(bufnr):match('%.txt$') then
      on_dir(vim.fn.getcwd())
    end
  end,

  settings = {
    "foo"
  }
}
