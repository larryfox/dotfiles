set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
set runtimepath^=~/.config/nvim/bundle/vim-go
set runtimepath^=~/.config/nvim/bundle/yats.vim
set runtimepath^=~/.config/nvim/bundle/neomake

let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlP"
let g:ctrlp_user_command = "rg %s -i --files --no-heading"

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_term_mode = "split"
let g:go_highlight_types = 0
let g:go_highlight_operators = 0



" ==============
" Neomake Config
" ==============

let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_typescript_tslint_exe = 'npx'
let g:neomake_typescript_tslint_args = ['tslint', '-t', 'prose']

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = 'npx'
let g:neomake_javascript_eslint_args = ['eslint', '--format=compact']

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
autocmd BufWritePost,BufEnter * Neomake



" ==========
" Vim Config
" ==========

syntax off
set number relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set number relativenumber

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" enable mouse reporting
set mouse=a

filetype plugin indent on

autocmd BufRead,BufNewFile *.swift setlocal tabstop=4 shiftwidth=4
autocmd FileType c setlocal tabstop=4 shiftwidth=4
autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab

" spell check for git messages cause i'm bad at it
autocmd FileType gitcommit setlocal spell

" allow esc key to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" strip trailing whitespace on save
function! StripTrailingWhitespace()
  let save_cursor = getcurpos()
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * :call StripTrailingWhitespace()

" MacOS(ish) style tab navigation
" map <D-[> :tabprevious<CR>
" nmap <D-[> :tabprevious<CR>
" imap <D-[> <Esc>:tabprevious<CR>i
" map <D-]> :tabnext<CR>
" nmap <D-]> :tabnext<CR>
" imap <D-]> <Esc>:tabnext<CR>i
" nmap <D-t> :tabedit<CR>
" imap <D-t> <Esc>:tabedit<CR>
