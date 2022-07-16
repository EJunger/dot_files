"set path+=**
set path=.,,**

lua require('cowgirl')

let mapleader=" "

inoremap jk <esc>
inoremap kj <esc>
inoremap JK <esc>
inoremap KJ <esc>

"<C-O> allows one n mode cmd to run
inoremap <leader>uu <C-O>:u<CR>
inoremap <C-s> <C-O>:w<CR>

nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>q :bd<CR>

nnoremap <C-s> :w<CR>

nmap <leader>e :NvimTreeToggle<CR>

noremap <F2> :lua package.loaded.emma = nil<CR>:source ~/.config/nvim/init.vim<CR>

nnoremap <leader>/ <cmd>lua require("cowgirl.tele-config").curr_buf()<CR>
nmap <leader>ff :Telescope find_files<CR>
nmap <leader>fv :Telescope file_browser<CR>
nmap <leader>fvi :Telescope file_browser hidden=true<CR>

nmap <leader>hm :lua require("harpoon.mark").add_file()<CR>
nmap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>hn :lua require("harpoon.ui").nav_next()<CR>
nmap <leader>hp :lua require("harpoon.ui").nav_prev()<CR>

"nnoremap <silent> <leader>lg :LazyGit<CR>

"noremap <F5> :lua require("dap").continue()<CR>
"noremap <F10> :lua require("dap").step_over()<CR>
"noremap <F11> :lua require("dap").step_into()<CR>
"noremap <F12> :lua require("dap").step_out()<CR>
"noremap <leader>tb require("dap").toggle_breakpoint()<CR>
"noremap <leader>sbc require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
"noremap <leader>sbn require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: '))CR>
"noremap <leader>dr require("dap").repl.open()<CR>


" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Quick-fix
nnoremap <silent> vc    <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
