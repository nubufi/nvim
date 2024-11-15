return {
  'mg979/vim-visual-multi',
  lazy = true,
  event = "VeryLazy",
  -- See https://github.com/mg979/vim-visual-multi/issues/241
  init = function()
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
}
