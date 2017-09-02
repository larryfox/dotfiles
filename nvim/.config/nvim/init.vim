set runtimepath^=~/.config/nvim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'rg %s -i --files --no-heading'

syntax off
set number

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" enable mouse reporting
set mouse=a

autocmd FileType rust setlocal tabstop=4 shiftwidth=4
autocmd FileType swift setlocal tabstop=4 shiftwidth=4
autocmd FileType go setlocal tabstop=8 shiftwidth=8 noexpandtab

" allow esc key to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" strip trailing whitespace on save
function! StripTrailingWhitespace()
  let save_cursor = getcurpos()
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * :call StripTrailingWhitespace()

