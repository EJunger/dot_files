"set path=.,,**

set mouse=a
set hidden
set noswapfile
"set clipboard=unnanedplus

set nu
set relativenumber
set signcolumn=yes
set cursorline
set scrolloff=8
set nowrap
set showmatch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set hlsearch
set incsearch
set nohlsearch
set ignorecase
set smartcase

set splitright
set splitbelow

set termguicolors
colorscheme spacemacs-theme
highlight Normal guibg=none

" lsp config test
set completeopt=menuone,noinsert,noselect
set shortmess+=c

set grepprg=rg\ -H\ --no-heading\ --smart-case\ --vimgrep
set grepformat=%f:%l:%c:%m
"--set.colorscheme = 'spacemacs-theme'
"--set.highlight = 'Normal guibg=none'
"--set.syntax = 'on'
"--set.filetype = 'plugin on'

set updatetime=300
