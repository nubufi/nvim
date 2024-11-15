return {
  -- Other plugins here...
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Configure providers here
          require("hover.providers.lsp")
          -- You can also include other providers like dictionary or treesitter
        end,
        preview_opts = {
          border = "rounded"  -- Set border style
        },
        title = true  -- Show title of the hover window
      }

      -- Keymaps for hover actions
      vim.keymap.set("n", "K", require("hover").hover, {desc = "Hover documentation"})
      vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "Select hover"})
    end,
    lazy = false,  -- Make sure it loads immediately, or set to true for lazy loading
  },
}

