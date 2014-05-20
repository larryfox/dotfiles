""""
"""" Pathogen
""""

set nocompatible             " be iMproved

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


""""
"""" Editor Settings
""""

" no modelines
set modelines=0

" utf8 always
set encoding=utf-8

" colors
set background=light
set t_Co=256
colorscheme GitHub

" use 2 spaces for tabs, turn on automatic indenting
set tabstop=4 softtabstop=2 shiftwidth=2 expandtab

" make backspace and cursor keys wrap accordingly
set whichwrap+=<,>,h,l

" smarter indenting for brackets, etc
set smartindent

" always show 3 lines when scrolling
set scrolloff=3

" jump to the matching bracket quickly when inserting a matching one
set showmatch

" disable folding
set nofoldenable

set dictionary+=/usr/share/dict/words


""""
"""" Visual options
""""

" syntax highlighting
syntax on

" highlight search terms
set hlsearch

" hine gutters and highlights
set number
set numberwidth=4

" hightlight current line
set cursorline

" hightlight column 80
set colorcolumn=80


""""
"""" Search options
""""

" ignore case
set ignorecase
" except when we suplly one
set smartcase

set gdefault
set hlsearch


""""
"""" File options
""""

" disable backup files
set nobackup

" disable swap files
set noswapfile

" better linebreaks
set linebreak


""""
"""" Input options
""""

" change files/buffer quickly
set wildmode=longest,list,full

" faster terminal rendering
set ttyfast

" Split panes naturally
set splitbelow
set splitright

set showmode


""""
"""" Key mappings
""""

" Use ; instead of :
nnoremap ; :

" n00b mode / disable arrow keys
noremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" Move around splits with ctrl + j,k,h,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = ","

" start a search
nnoremap / /\v
vnoremap / /\v

" clear highlights
nnoremap <leader><space> :nohlsearch<cr>

nnoremap <tab> %
vnoremap <tab> %

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <ESC>

" Easy buffer switching
nnoremap <leader><leader> <c-^>


autocmd FileType ruby nmap <buffer> mm <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> mm <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> mr <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> mr <Plug>(xmpfilter-run)


" Relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

set relativenumber
" Toggle line number modes with ctrl + n
nnoremap <C-n> :call NumberToggle()<cr>
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Toggle to absolute numbers in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
