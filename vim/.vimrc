""""
"""" Pathogen
""""

set nocompatible             " be iMproved

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on

set number
set relativenumber

set autoindent
set smartindent
set encoding=utf-8
set showmatch
set ruler

set backspace=indent,eol,start

set sidescrolloff=4
set scrolloff=4


" colors
syntax on
set background=light
set t_Co=256
colorscheme GitHub

set tabstop=4 softtabstop=2 shiftwidth=2 expandtab

let mapleader = ","

" Searching
set hlsearch
set ignorecase
set smartcase
" clear highlights
nnoremap <leader><space> :nohlsearch<cr>


set nobackup
set noswapfile
set linebreak

" :e <Tab>
set wildmode=longest,list,full
set wildignore+=.git,.bundle,.yard,*.o,*.rbc

" faster terminal rendering
set ttyfast

set showmode

" Use ; instead of :
nnoremap ; :

" Split panes naturally
set splitbelow
set splitright

" Move around splits with ctrl + j,k,h,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap / /\v
vnoremap / /\v


inoremap jj <ESC>

" Easy buffer switching
nnoremap <leader><leader> <c-^>

" xmpfilter for inline ruby interpretation
autocmd FileType ruby nmap <buffer> mm <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> mm <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> mr <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> mr <Plug>(xmpfilter-run)
au BufRead,BufNewFile *.md set filetype=markdown
