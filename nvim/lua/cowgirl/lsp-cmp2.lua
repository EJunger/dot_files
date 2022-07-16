local Remap = require("cowgirl.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

--local sumneko_root_path = "/home/mpaulson/personal/lua-language-server"
--local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	--youtube = "[Suck it YT]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	--nvim_lua = "[Lua]",
	--cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")


cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.confirm({ select = true }),
		["<A-u>"] = cmp.mapping.scroll_docs(-4),
		["<A-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya

		--{ name = "cmp_tabnine" },

		{ name = "nvim_lsp" },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },

		--{ name = "youtube" },
	},
})

--local tabnine = require("cmp_tabnine.config")
--tabnine:setup({
	--max_lines = 1000,
	--max_num_results = 20,
	--sort = true,
	--run_on_every_keystroke = true,
	--snippet_placeholder = "..",
--})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vc", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<leader>vhh", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

--require("lspconfig").tsserver.setup(config())

--[[  I cannot seem to get this woring on new computer..
require("lspconfig").clangd.setup(config({
	cmd = { "clangd", "--background-index", "--log=verbose" },
    root_dir = function()
        print("clangd-Rootdir", vim.loop.cwd())
		return vim.loop.cwd()
	end,
}))
--]]
--require("lspconfig").ccls.setup(config())

--require("lspconfig").jedi_language_server.setup(config())

--require("lspconfig").svelte.setup(config())

--require("lspconfig").solang.setup(config())

--require("lspconfig").cssls.setup(config())

--require("lspconfig").gopls.setup(config({
	--cmd = { "gopls", "serve" },
	--settings = {
		--gopls = {
			--analyses = {
				--unusedparams = true,
			--},
			--staticcheck = true,
		--},
	--},
--}))

local nvim_lsp = require("lspconfig")

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)



--require("lspconfig").sumneko_lua.setup(config({
	--cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	--settings = {
		--Lua = {
			--runtime = {
				---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				--version = "LuaJIT",
				---- Setup your lua path
				--path = vim.split(package.path, ";"),
			--},
			--diagnostics = {
				---- Get the language server to recognize the `vim` global
				--globals = { "vim" },
			--},
			--workspace = {
				---- Make the server aware of Neovim runtime files
				--library = {
					--[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					--[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				--},
			--},
		--},
	--},
--}))

--local opts = {
	---- whether to highlight the currently hovered symbol
	---- disable if your cpu usage is higher than you want it
	---- or you just hate the highlight
	---- default: true
	--highlight_hovered_item = true,

	---- whether to show outline guides
	---- default: true
	--show_guides = true,
--}

--require("symbols-outline").setup(opts)

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})
