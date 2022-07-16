augroup DynamicNumberToggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

augroup InstallerBorder
    autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = "none" })
augroup END

autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
