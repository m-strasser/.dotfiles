sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ $? -ne 0 ]; then
	echo "Installing oh-my-zsh failed, exiting"
	exit 1
fi
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
if [ $? -ne 0 ]; then
	echo "Cloning FZF failed, exiting"
	exit 1
fi
~/.fzf/install
if [ $? -ne 0 ]; then
	echo "Installing FZF failed, exiting"
	exit 1
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
	echo "Cloning Vundle failed, exiting"
	exit 1
fi
vim +PlugInstall +qall
