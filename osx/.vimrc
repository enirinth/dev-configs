" this needs to be placed before the loading of vim-polyglot
let g:polyglot_disabled = ['cpp','c++','c++11','c/c++']

"----------------------------------------------------------------------------------------------------------------------
" Plugin list
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

""""" color themes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

""""" syntax highlighting
Plug 'vim-airline/vim-airline'
" syntax highlighting support for 150+ languages (excluding for C/C++)
Plug 'sheerun/vim-polyglot'
" for C/C++
Plug 'bfrg/vim-cpp-modern'

""""" major functionalities
Plug 'lambdalisue/fern.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""""" small tweaks/utilities
" enable * without cursor move and * in visual mode
Plug 'haya14busa/vim-asterisk'
Plug 'machakann/vim-highlightedyank'
" looks like it's needed for (at least) fern, until nvim fixes https://github.com/neovim/neovim/issues/12587
Plug 'antoinemadec/FixCursorHold.nvim'
call plug#end()

"----------------------------------------------------------------------------------------------------------------------
" vim settings
"----------------------------------------------------------------------------------------------------------------------
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
set splitright " always open split on the right
set ffs=unix
set ff=unix
set hlsearch
" (in case I forgot) "start" allows backspace to delete txt existed before entering insertion mode
set backspace=indent,eol,start
" Airline Status Bar Settings
set laststatus=2

"----------------------------------------------------------------------------------------------------------------------
" Filetypes
"----------------------------------------------------------------------------------------------------------------------
" line margin overrides by file type
autocmd FileType markdown set cc=120
autocmd FileType dockerfile set cc=120
autocmd FileType yaml set cc=120
autocmd FileType text set cc=120
autocmd FileType vim set cc=120
" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

"----------------------------------------------------------------------------------------------------------------------
" Color theme selection
"----------------------------------------------------------------------------------------------------------------------
"colorscheme onedark
"colorscheme nord
"colorscheme dracula
"colorscheme onehalfdark
colorscheme gruvbox
"colorscheme one
"set background=light " for colorscheme one -- dark or light

let g:airline_theme='gruvbox'

"----------------------------------------------------------------------------------------------------------------------
" Leader key
"----------------------------------------------------------------------------------------------------------------------
let mapleader=" "
let maplocalleader=" "

"----------------------------------------------------------------------------------------------------------------------
" Short cuts for navigation across splits
"----------------------------------------------------------------------------------------------------------------------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"----------------------------------------------------------------------------------------------------------------------
" fern
"----------------------------------------------------------------------------------------------------------------------
" template from official README: https://github.com/lambdalisue/fern.vim/blob/master/README.md
" heavily inspired by: https://github.com/nickjj/dotfiles/blob/master/.vimrc
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" two spaces' of indentation
let g:fern#renderer#default#leading = ' '
let g:fern#renderer#default#leaf_symbol = ' '
let g:fern#renderer#default#collapsed_symbol = '▶ '
let g:fern#renderer#default#expanded_symbol = '◿ '

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

let g:fern#disable_default_mappings = 1
let g:fern#disable_viewer_hide_cursor = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> . <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> x <Plug>(fern-action-mark:toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

"----------------------------------------------------------------------------------------------------------------------
" search and replace
"----------------------------------------------------------------------------------------------------------------------
" copied from: https://github.com/nickjj/dotfiles/blob/master/.vimrc
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///gc<Left><Left><Left>
nnoremap <Leader>ra :%s///g<Left><Left>
" only applied to previously visually selected range
xnoremap <Leader>r :s///gc<Left><Left><Left>
xnoremap <Leader>ra :s///g<Left><Left>

" Global (multi-file) search and replace:
"   1. Rg <pattern>
"   2. select intended files of interest
"   3. press the below shortcut
"   4. retype pattern (TODO: optimize)
"   5. type text after replacement
nnoremap <Leader>R :cfdo %s///g \| update 
      \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

"----------------------------------------------------------------------------------------------------------------------
" fzf
"----------------------------------------------------------------------------------------------------------------------
:nnoremap <silent> <C-p> :Files<CR>
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp' } }

" customizing Files and Rg with a preview window
" copied from https://github.com/junegunn/fzf.vim/blob/master/README.md
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always " .
  \ <q-args>, 1, fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--layout=reverse', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <silent> <Leader>g :RG<CR>

"----------------------------------------------------------------------------------------------------------------------
" vim-cpp-modern
"----------------------------------------------------------------------------------------------------------------------
"let g:cpp_simple_highlight = 1
"let g:cpp_no_function_highlight = 1
let g:cpp_named_requirements_highlight = 1

"----------------------------------------------------------------------------------------------------------------------
" markdown preview
"----------------------------------------------------------------------------------------------------------------------
" for markdown-preview vim (only for nvim)
" nvim will open the preview window after entering the markdown buffer
let g:mkdp_auto_start = 1

"----------------------------------------------------------------------------------------------------------------------
" vim-highlightedyank
"----------------------------------------------------------------------------------------------------------------------
" highlight duration (ms)
let g:highlightedyank_highlight_duration = 1000

"----------------------------------------------------------------------------------------------------------------------
" vim-asterisk
"----------------------------------------------------------------------------------------------------------------------
nmap <silent> *   <Plug>(asterisk-z*)
nmap <silent> #   <Plug>(asterisk-z#)
nmap <silent> g*  <Plug>(asterisk-gz*)
nmap <silent> g#  <Plug>(asterisk-gz#)
" same as above but for visual mode
xmap <silent> *   <Plug>(asterisk-z*)
xmap <silent> #   <Plug>(asterisk-z#)
xmap <silent> g*  <Plug>(asterisk-gz*)
xmap <silent> g#  <Plug>(asterisk-gz#)

"----------------------------------------------------------------------------------------------------------------------
" insert VMG OSS header
"----------------------------------------------------------------------------------------------------------------------
function! Class()
    " ~/vim/cpp/new-class.txt is the path to the template file
    r/Users/aaronwang/.vim/headers/VMG_OSS_Header_cpp
endfunction
nmap <leader>H :call Class()<CR>

