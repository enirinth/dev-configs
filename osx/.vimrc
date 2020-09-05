let g:polyglot_disabled = ['cpp','c++','c++11','c/c++']
call plug#begin('~/.vim/plugged')

""""" color themes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

""""" syntax highlighting
Plug 'vim-airline/vim-airline'
" syntax highlighting support for 150+ languages
Plug 'sheerun/vim-polyglot'
Plug 'bfrg/vim-cpp-modern'

""""" major functionalities
Plug 'scrooloose/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""""" small tweaks/utilities
" enable * without cursor move and * in visual mode
Plug 'haya14busa/vim-asterisk'
Plug 'machakann/vim-highlightedyank'
call plug#end()

syntax on
filetype plugin indent on
set number  "show line number
set mouse=a  "allow scrolling without ctrl+f/b
set expandtab  " tabs are spaces, not tabs
set tabstop=8  " how many cols a tab counts for - use to display text
set softtabstop=2  " how many cols a tab counts for - use to edit text
set shiftwidth=2  " how many cols a tab counts for - use in auto indent
set autoindent
set cursorline  " hightlight current line
set termguicolors "true colors (need nvim > 0.1.5 or VIM > patch 7.4.1799)
set cc=80  " default line margin
set clipboard=unnamedplus
" file type
set ffs=unix
set ff=unix

let mapleader=" "
let maplocalleader=" "

" copied from: https://github.com/nickjj/dotfiles/blob/master/.vimrc
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///gc<Left><Left><Left>
nnoremap <Leader>ra :%s///g<Left><Left>
" only applied to previously visually selected range
xnoremap <Leader>r :s///gc<Left><Left><Left>
xnoremap <Leader>ra :s///g<Left><Left>

nnoremap <Leader>R :cfdo %s///g \| update 
      \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" line margin overrides by file type
autocmd FileType markdown set cc=120
autocmd FileType dockerfile set cc=120
autocmd FileType yaml set cc=120
autocmd FileType text set cc=120
autocmd FileType vim set cc=120
" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

set splitright " always open split on the right

" ctrl-p for fzf
:nnoremap <silent> <C-p> :Files<CR>
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" customizing Files and Rg with a preview window
" copied from https://github.com/junegunn/fzf.vim/blob/master/README.md
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, 1,
      \ fzf#vim#with_preview(), <bang>0)

"colorscheme onedark
"colorscheme nord
"colorscheme dracula
"colorscheme onehalfdark
colorscheme gruvbox
"colorscheme one
"set background=light " for colorscheme one -- dark or light

let g:airline_theme='gruvbox'

"" vim-cpp-modern
"let g:cpp_simple_highlight = 1
"let g:cpp_no_function_highlight = 1
let g:cpp_named_requirements_highlight = 1

"" vim-cpp-enhanced-highlight
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1


" for markdown-preview vim (only for nvim)
" nvim will open the preview window after entering the markdown buffer
let g:mkdp_auto_start = 1

" backspace
" set backspace=start " allow backspace to delete txt existed before entering
" insert mode
" Uncomment below if you want backspace to function no matter where in insert
" mode
set backspace=indent,eol,start
set hlsearch

" vim-highligntenyank settings
" highlight duration 2 sec
let g:highlightedyank_highlight_duration = 1000

" command aliases
:command NT NERDTree
let NERDTreeIgnore=['\.o$','\.so$','\.a$','\.d$','\.DS_Store$']

" Airline Status Bar Settings
set laststatus=2

" Navigation across splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" vim-asterisk settings, which enable:
" 1. pressing * doesn't cause cursor to move
" 2. search highlighted text if selected in visual mode and then press *
nmap <silent> *   <Plug>(asterisk-z*)
nmap <silent> #   <Plug>(asterisk-z#)
nmap <silent> g*  <Plug>(asterisk-gz*)
nmap <silent> g#  <Plug>(asterisk-gz#)
" same as above but for visual mode
xmap <silent> *   <Plug>(asterisk-z*)
xmap <silent> #   <Plug>(asterisk-z#)
xmap <silent> g*  <Plug>(asterisk-gz*)
xmap <silent> g#  <Plug>(asterisk-gz#)
