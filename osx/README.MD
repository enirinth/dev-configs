# dot files and  dev-configs for OSX

## pre-install List
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
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
```
## install (do this lastly)
```
bash setup.sh
```


