-- init.lua:
-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  tag = '0.1.5',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
