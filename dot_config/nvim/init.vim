call plug#begin()
Plug 'tpope/vim-surround'
call plug#end()

set clipboard=unnamedplus
set cursorline
set mouse=a
set nowrap
set number
set splitbelow
set splitright
set termguicolors

" ## Search
set ignorecase
set smartcase

" ## Tabs
set expandtab
set softtabstop=2
set shiftwidth=2

" ## Keys
let mapleader = " "
vnoremap ; :
nnoremap ; :
nnoremap <silent> <leader>vv :!reload<cr> \| :source $MYVIMRC<cr>
nnoremap <silent> <leader>vp :!reload<cr> \| :source $MYVIMRC<cr> \| :PlugInstall<cr>

" Clear search term
nnoremap <silent> <leader>/ :nohlsearch<cr>

" ### Tabbing
nnoremap <silent> <leader>tt :tabnew<cr>
nnoremap <silent> <leader>tn :tabnext<cr>
nnoremap <silent> <leader>tp :tabprevious<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> } :tabnext<cr>
nnoremap <silent> { :tabprevious<cr>

" ### Splits
nnoremap <silent> <leader>\| :vsplit<cr>
nnoremap <silent> <leader>- :split<cr>
