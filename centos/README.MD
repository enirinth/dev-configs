# dot files and  dev-configs for Fedora

## pre-install List
  - python and python dev (python extension support)
```sh
yum install pyton-devel
```
  - java   
  - g++/gcc   
  - CMake
```sh
yum install cmake 
```
  - llvm and clang
yum install clang 
  - ssh-copy-id   
  - exuberant-ctags(mac)
```sh
yum install ctags
```
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
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
```
## install (do this lastly)
```
bash setup.sh
```


