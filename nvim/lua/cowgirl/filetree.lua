require'nvim-tree'.setup{
    -- auto_close = true,
    --auto_reload_on_write = true,
    diagnostics = {
        enable = true,
    },
    view = {
        side = "left",
        number = false,
        relativenumber = false,
        signcolumn = "no",
    },
}

-- remove fillchars '~' NOTE: probs move this later
vim.opt.fillchars:append('eob: ')
