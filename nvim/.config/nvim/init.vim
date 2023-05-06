set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
set runtimepath^=~/.config/nvim/bundle/yats.vim


" ==============
" Ctrl P Config
" ==============

let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlP"
let g:ctrlp_user_command = "rg %s -i --files --no-heading"


" ==============
" ALE Config
" ==============

" nothing, just works for now


" ==============
" Vim Config
" ==============

syntax off
set background=light

" ---------------------
" relative line numbers
" except in insert mode
" ---------------------
set number relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set number relativenumber

" --------------------------
" case insensitive searching
" --------------------------
set ignorecase
set smartcase

" ----------------------
" enable mouse reporting
" ----------------------
set mouse=a

" ------------------
" space/tab settings
" ------------------
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

filetype plugin indent on

autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.swift setlocal tabstop=4 shiftwidth=4
autocmd FileType c setlocal tabstop=4 shiftwidth=4
autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab

" ----------------------------
" spell check for git messages
" ----------------------------
autocmd FileType gitcommit setlocal spell

" -----------------------------------
" allow esc key to exit terminal mode
" -----------------------------------
tnoremap <Esc> <C-\><C-n>

" ---------------------------------
" strip trailing whitespace on save
" ---------------------------------
function! StripTrailingWhitespace()
  let save_cursor = getcurpos()
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespace()

" ------------
" load plugins
" ------------
packloadall
silent! helptags ALL
