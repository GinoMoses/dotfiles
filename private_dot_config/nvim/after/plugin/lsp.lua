local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
	['<Down>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = false }),
	['<C-l>'] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'rust_analyzer'},
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()
