execute pathogen#infect()
syntax on
filetype plugin indent on
set number  "show line number
:set mouse=a  "allow scrolling without ctrl+f/b
set expandtab  " tabs are spaces, not tabs
set tabstop=2  " how many cols a tab counts for - use to display text
set softtabstop=2  " how many cols a tab counts for - use to edit text
set shiftwidth=2  " how many cols a tab counts for - use in auto indent
:set cursorline  " hightlight current line
:set cc=80  " set right margin
set splitright " always open split on the right
set autoindent
set cindent

" file type
set ffs=unix
set ff=unix

" backspace
" set backspace=start " allow backspace to delete txt existed before entering insert mode
" Uncomment below if you want backspace to function no matter where in insert
" mode
set backspace=indent,eol,start

" set color theme to one dark
let g:airline_eheme = 256
colorscheme onedark

" ycm comfig
let g:ycm_autoclose_preview_window_after_insertion = 1


" command aliases
:command NT NERDTree
:command TB TagbarToggle

" ctrlP settings
let g:ctrlp_max_files=0  " no limit to how many files ctrpP indexes
let g:ctrlP_max_depth=40

" Airline Status Bar Settings
set laststatus=2

" Navigation across splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" function and shortcuts for yanking/cutting search match under cursor
" e.g. di/ = delete match under cursor
"      yi/ = yank match under cursor
vnoremap <silent> i/ :<c-u>call SelectMatch()<cr>
onoremap <silent> i/ :call SelectMatch()<cr>
function! SelectMatch()
    if search(@/, 'bcW')
        norm! v
        call search(@/, 'ceW')
    else
        norm! gv
    endif
endfunction
