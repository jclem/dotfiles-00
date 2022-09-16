call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rose-pine/neovim', { 'as': 'rose-pine', 'tag': 'v1.*' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()

lua require('rose-pine/main')

function! ToggleDarkMode()
  if &background == 'dark'
    set background=light
  else
    set background=dark
  endif
endfunction

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
nnoremap <silent> <leader>/ :nohlsearch<cr>
nnoremap <silent> <leader>dm :call ToggleDarkMode()<cr>

" ### FZF
nnoremap <silent> <leader>fd :Files<cr>
nnoremap <silent> <leader>fs :Rg<cr>

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
