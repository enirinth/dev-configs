# Only run this script if this is a new dev-vm
# There are functions needed to be added to vimrc, without echoing here, just copy the whole vimrc file

cp -i .vimrc ~/

# vim one-dark editor color theme
mkdir -p ~/.vim/colors/
cp -i onedark.vim ~/.vim/colors/

# vim protobuf syntax highlighting
mkdir -p ~/.vim/syntax/
cp -i proto.vim ~/.vim/syntax/ 

# install pathogen - vim plugin management
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim 

# create symlink from built-in vim to MacVim
echo '# create symlink from MacVim to built-in vim' >> ~/.bashrc
echo 'alias vim='/usr/local/Cellar/macvim/7.4-104/MacVim.app/Contents/MacOS/Vim'' >> ~/.bashrc
