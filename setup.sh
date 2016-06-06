# Only run this script if this is a new dev-vm

cp -i .vimrc ~/

cp -i onedark.vim ~/.vim/colors/ # vim one-dark editor color theme

# install pathogen - vim plugin management
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim 
echo 'execute pathogen#infect()' >> ~/.vimrc 
echo 'filetype plugin indent on' >> ~/.vimrc
