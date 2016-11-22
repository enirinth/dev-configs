syntax on
set number  "show line number
:set mouse=a  "allow scrolling without ctrl+f/b
" set expandtab  " tabs are spaces, not tabs
set tabstop=2  " how many cols a tab counts for - use to display text
set softtabstop=2  " how many cols a tab counts for - use to edit text
set shiftwidth=2  " how many cols a tab counts for - use in auto indent
:set cursorline  " hightlight current line
:set cc=80  " set right margin

" file type
set ffs=unix 
set ff=unix

" backspace
set backspace=start " allow backspace to delete txt existed before entering insert mode
" Uncomment below if you want backspace to function no matter where in insert
" mode
" set backspace=indent,eol,start 

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
:command TB TagbarToggle

" ctrlP settings
let g:ctrlp_max_files=0  " no limit to how many files ctrpP indexes
let g:ctrlP_max_depth=40

" YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }

" Airline Status Bar Settings
set laststatus=2

" Vim-latex live preview settings
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer	= 'open -a Preview'

" clang-format settings
map <C-N> :pyf /usr/local/Cellar/llvm/3.8.1/share/clang/clang-format.py<cr>
imap <C-N> <c-o>:pyf /usr/local/Cellar/llvm/3.8.1/share/clang/clang-format.py<cr>

" Navigation across splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

