sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ $? -ne 0 ]; then
	echo "Installing oh-my-zsh failed, exiting"
	exit 1
fi
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
if [ $? -ne 0 ]; then
	echo "Cloning FZF failed, exiting"
	#exit 1
fi
~/.fzf/install
if [ $? -ne 0 ]; then
	echo "Installing FZF failed, exiting"
	#exit 1
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
	echo "Cloning Vundle failed, exiting"
	#exit 1
fi
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
echo "Overwriting .vimrc and .zshrc..."
mv $HOME/.vimrc $HOME/.vimrc.bak
mv $HOME/.zshrc $HOME/.zshrc.bak
echo "Backed up old files as .vimrc.bak and .zshrc.bak"
ln -s $SCRIPTPATH/.vimrc $HOME/.vimrc
ln -s $SCRIPTPATH/.zshrc $HOME/.zshrc
echo "Set up symlinks to .dotfiles repo for .vimrc and .zshrc"
echo "Installing vim plugins..."
vim +PlugInstall +qall
