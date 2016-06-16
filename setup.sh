#!/bin/sh

# Install ZSH
apt-get install -y zsh

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Make softlinks for vim and tmux and zsh theme
if [ -f $HOME/.vimrc ]; then
	echo "Found .vimrc in home directory, moving it to .vimrc.pre-install"
	mv $HOME/.vimrc $HOME/.vimrc.pre-install
fi

if [ -f $HOME/.tmux.conf ]; then
	echo "Found .tmux.conf in home directory, moving it to .tmux.conf.pre-install"
	mv $HOME/.tmux.conf $HOME/.tmux.conf.pre-install
fi

if [ -f $HOME/.zshrc ]; then
	echo "Found .zshrc in home directory, moving it to .zshrc.pre-install"
	mv $HOME/.zshrc $HOME/.zshrc.pre-install
fi

if [ -f $HOME/.oh-my-zsh/themes/my.zsh-theme ]; then
	echo "Found my.zsh-theme, moving it to my.zsh-theme.pre-install"
	mv $HOME/.oh-my-zsh/themes/my.zsh-theme $HOME/.oh-my-zsh/themes/my.zsh-theme.pre-install
fi

ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/my.zsh-theme $HOME/.oh-my-zsh/themes/my.zsh-theme
