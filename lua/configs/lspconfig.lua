-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local null_ls = require("null-ls")

-- EXAMPLE
local servers = { "html", "cssls","ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pyright.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"python"},
})

lspconfig.gopls.setup({
	capabilities = nvlsp.capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
			completeUnimported = true,
			usePlaceholders = true,
		},
	},
	on_attach = nvlsp.on_attach,
})

lspconfig.tailwindcss.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = { "templ", "astro", "javascript", "typescript", "react", "javascriptreact", "typescriptreact", "tsx", "jsx" },
	init_options = { userLanguages = { templ = "html" } },
})

lspconfig.html.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = { "html", "templ" },
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length", "88" },  -- Optional: customize line length
    }),
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

lspconfig.ruff.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    -- Enable formatting capability if not already set
    client.server_capabilities.documentFormattingProvider = true
  end,
  capabilities = nvlsp.capabilities,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
      lint = {
        enable = false,  -- Disable linting
      },
    }
  }
}
