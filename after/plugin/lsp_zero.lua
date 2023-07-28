local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr }

	vim.keymap.set({ 'n', 'x' }, 'gq', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')

cmp.setup({
	---
	-- Add you own config here...
	---
	mappings = {
		['<C-y>'] = cmp.mapping.confirm({ select = false }),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
	}

})
