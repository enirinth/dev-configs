# dot files and  dev-configs for OSX

## pre-install List
  - git
    - `git config --global core.editor "vim"` 
  - python   
  - java (preferrably 1.8)
  - g++/gcc (not necessary if you already have xcode cli tools)
  - CMake (not necessary if you already have xcode cli tools)
  - ssh-copy-id   
  - exuberant-ctags(mac)
```sh
brew install ctags
```
  - MacVim (brew or download .dmg)   
  - pathogen
```sh
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

## install vim plugins using pathogen
```sh
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone git://github.com/tpope/vim-surround.git 
git clone git://github.com/majutsushi/tagbar 
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/suan/vim-instant-markdown
git clone https://github.com/terryma/vim-expand-region

cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
```
## install (do this lastly)
```
bash setup.sh
```
## config clang-format
install llvm    
locate `clang-format.py`   
add to `~/.vimrc`:
```
map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>     
imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>
```
specify project by generating .clang-format in project root directory
`clang-format -style=llvm -dump-config > .clang-format`

