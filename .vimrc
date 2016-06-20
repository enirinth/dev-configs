syntax on
set number  "show line number
:set mouse=a  "allow scrolling without ctrl+f/b
set expandtab  " tabs are spaces, not tabs
set tabstop=4  " an indentation every four columns
set softtabstop=4  " let backspace delete indent
:set cursorline
:set cc=80

" file type
set ffs=unix 
set ff=unix

" set color theme to one dark
let g:airline_eheme = 256
colorscheme onedark

" enable protobuf syntax highlighting
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" enable pathogen
execute pathogen#infect() 
filetype plugin indent on

" command aliases
:command NT NERDTree

" tagbar shortcut
:command TB TagbarToggle
