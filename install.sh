#!/usr/bin/env zsh

# submodule for vim and shell utils
git submodule init
git submodule update

# git config
cp .gitignore ~/
git config --global core.excludesfile ~/.gitignore
git config --global user.email "bpowell29a@gmail.com"
git config --global user.name "Brandon Powell"
git config --global alias.co checkout

# tmux setup
cp .tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "In tmux press 'prefix + I' to install plugins"

# zsh
cp -R .zsh* ~/
cp -R .shellutils/ ~/

# vim setup
cp -R .vim* ~/
vim -c 'GoInstallBinaries' -c 'q'
