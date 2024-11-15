return {
  "nvimtools/none-ls.nvim",
  config = function()
      local null_ls = require("null-ls")

      -- Configure null-ls with the Black formatter
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length", "88" },  -- Optional: customize line length
          }),
        },
      })
    end,
    lazy = false,
}
