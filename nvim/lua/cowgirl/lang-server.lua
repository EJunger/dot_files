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

require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rust-analyzer" }, --"nightly", "run","rustup",
}))
-- locals
--local opts = { noremap = true, silent = true }
---- global
--local glo_map = vim.api.nvim_set_keymap
---- buffer local
--local buf_map = vim.api.nvim_buf_set_keymap
--local buf_opt = vim.api.nvim_buf_set_option
--
--function CreateNoremap(type, opts)
	--return function(lhs, rhs, bufnr)
        --bufnr = bufnr or 0
		--vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
	--end
--end

--Nnoremap = CreateNoremap("n", { noremap = true })
--Inoremap = CreateNoremap("i", { noremap = true })

--local nvim_lsp = require'lspconfig'

--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--local on_attach = function()
    --Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
    --Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
    --Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
    --Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
    --Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
    --Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
    --Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
    --Nnoremap("<leader>rf", ":lua vim.lsp.buf.references()<CR>")
    --Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
    --Nnoremap("<leader>di", "<cmd>Telescope diagnostics<CR>")
    --Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
--end


--local opts = {
    --tools = { -- rust-tools options
        --autoSetHints = true,
        --hover_with_actions = true,
        --inlay_hints = {
            --show_parameter_hints = false,
            --parameter_hints_prefix = "",
            --other_hints_prefix = "",
        --},
    --},
    ---- all the opts to send to nvim-lspconfig
    ---- these override the defaults set by rust-tools.nvim
    ---- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    --server = {
        ---- on_attach is a callback called when the language server attachs to the buffer
        --on_attach = on_attach,
        --settings = {
            ---- to enable rust-analyzer settings visit:
            ---- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            --["rust-analyzer"] = {
                ---- enable clippy on save
                --checkOnSave = {
                    ----command = "clippy"
                --},
            --}
        --}
    --},
--}

----nvim_lsp.rust_analyzer.setup{
    ----require('rust-tools').setup(opts),
    ----capabilities = capabilities,
    ----on_attach = on_attach,
    ------opts = opts,
----}

--require("lspconfig").rust_analyzer.setup(config({
	--cmd = { "rustup", "run", "nightly", "rust-analyzer" },
--}))


--local cmp = require'cmp'
--cmp.setup({
  ---- Enable LSP snippets
  ----snippet = {
    ----expand = function(args)
        ----vim.fn["vsnip#anonymous"](args.body)
    ----end,
  ----},
  --mapping = {
    --['<C-p>'] = cmp.mapping.select_prev_item(),
    --['<C-n>'] = cmp.mapping.select_next_item(),
    ---- Add tab support
    --['<S-Tab>'] = cmp.mapping.select_prev_item(),
    --['<Tab>'] = cmp.mapping.select_next_item(),
    --['<C-d>'] = cmp.mapping.scroll_docs(-4),
    --['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.close(),
    --['<CR>'] = cmp.mapping.confirm({
      --behavior = cmp.ConfirmBehavior.Insert,
      --select = true,
    --})
  --},

  ---- Installed sources
  --sources = {
    --{ name = 'nvim_lsp' },
    ----{ name = 'vsnip' },
    --{ name = 'path' },
    --{ name = 'buffer' },
  --},
--})

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

-- global diagnostics cmd
-- CHANGE GOTO AND PREV CMD
--glo_map("n", "gj", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

--glo_map("n", "gk", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--glo_map("n", "<leader>di", "<cmd>Telescope diagnostics<CR>", opts)
--glo_map("n", "<leader>fl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
----glo_map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

---- buffer local cmd
--local on_attach = function(client, bufnr)
---- Enable completion triggered by <c-x><c-o>
----buf_opt(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

----buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--buf_map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
----buf_map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
----buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
----buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
----buf_map(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--buf_map(bufnr, "n", "<leader>td", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--buf_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--buf_map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
----buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--buf_map(bufnr, "n", "<leader>fa", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--end

--local function config(_config)
	--return vim.tbl_deep_extend("force", {
		--capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		--on_attach = function()
			--Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			--Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			----Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
			--Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
			--Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
			--Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
			--Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
			--Nnoremap("<leader>rf", ":lua vim.lsp.buf.references()<CR>")
			--Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
			--Nnoremap("<leader>di", "<cmd>Telescope diagnostics<CR>")
			--Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		--end,
	--}, _config or {})
--end

--local servers = { "rust_analyzer" }
--for _, lsp in pairs(servers) do
--require("lspconfig")[lsp].setup({
--on_attach = on_attach,
--flags = {
---- This will be the default in neovim 0.7+
--debounce_text_changes = 150,
--},
--})
--end

---- additional tools - nvim-cmp
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

--local lspconfig = require("lspconfig")
--lspconfig.rust_analyzer.setup(
    --config({
		--cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    --}))

---- installer setup
--local lsp_installer = require("nvim-lsp-installer")

---- Include the servers you want to have installed by default below
--local servers = {
--"rust_analyzer",
--"tsserver",
--"sumneko_lua",
--"bashls",
--}

--for _, name in pairs(servers) do
--local server_is_found, server = lsp_installer.get_server(name)
--if server_is_found and not server:is_installed() then
--print("Installing " .. name)
--server:install()
--end
--end

--lsp_installer.on_server_ready(function(server)
---- Specify the default options which we'll use to setup all servers
--local opts = {
--on_attach = on_attach,
--}
--local workspace = {
--maxPreload = 10000, -- Add this if missing or increase it
--preloadFileSize = 10000, -- Add this if missing or increase it
--}
----if server.name == "rust_analyzer" then
------ Initialize the LSP via rust-tools instead
----require("rust-tools").setup({
------ The "server" property provided in rust-tools setup function are the
------ settings rust-tools will provide to lspconfig during init.            --
------ We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
------ with the user's own settings (opts).
----print("rust tools attached")
----server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
----})
----server:attach_buffers()
------ Only if standalone support is needed
----require("rust-tools").start_standalone_if_required()
----else
----server:setup(opts, workspace)
----end
--server:setup(opts, workspace)
--end)
