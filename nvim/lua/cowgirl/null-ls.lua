local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.rustfmt,
	formatting.prettier,
    formatting.stylua,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		--if client.name == "sumneko_lua" then
		--client.resolved_capabilities.document_formatting = false
		--client.resolved_capabilities.document_range_formatting = false
		--end
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
