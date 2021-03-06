# dot files and  dev-configs for Fedora

## pre-install List
  - git
    - set `git config --global core.editor "vim"` 
  - vim (latest version)
  - (need to enable python support before install, find Makefile and search for python, uncomment necessary part)
```sh
git clone https://github.com/vim/vim.git
cd vim/src
make install
```
  - python and python dev (python extension support)
```sh
sudo yum install python-devel
```
  - java   
  - g++/gcc
```sh
sudo yum install gcc   
sudo yum install gcc-c++    
```
  - CMake
```sh
sudo yum install cmake 
```
  - llvm and clang
```sh
sudo yum install clang
```
  - ssh-copy-id   
  - exuberant-ctags(mac)
```sh
sudo yum install ctags
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
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/terryma/vim-expand-region

cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
```
## install (do this lastly)
```
bash setup.sh
```


