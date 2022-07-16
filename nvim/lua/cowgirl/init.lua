require("cowgirl.plugins")
require("cowgirl.brackets")
require("cowgirl.filetree")
require("cowgirl.statusbar")
require("cowgirl.buffer")
require("cowgirl.treesitter-config")
--require("cowgirl.lang-server")
require("cowgirl.tele-config")
require("cowgirl.harpoon-config")
require("cowgirl.terminal")
--require("cowgirl.dap-conf")
require("cowgirl.dap")
require("cowgirl.lsp-cmp")
--require("cowgirl.null-ls")
--

-- another prime rip
local augroup = vim.api.nvim_create_augroup
CowgirlGroup = augroup('Cowgirl', {})

--require("cowgirl.cmp-use-rust")
--require("cowgirl.set")
--require("cowgirl.packer")
require("cowgirl.neogit")

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = CowgirlGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = CowgirlGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
