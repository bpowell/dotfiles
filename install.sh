#!/usr/bin/env zsh

# brew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle

# submodule for vim and shell utils
git submodule init
git submodule update

# config for zsh and brew
# https://github.com/zsh-users/zsh-completions/issues/433#issuecomment-567871401
for f in $(compaudit);do sudo chown -R $(whoami):admin $f;done;
for f in $(compaudit);do sudo chmod -R 755 $f;done;

# git config
cp .gitignore ~/
git config --global core.excludesfile ~/.gitignore
git config --global user.email "bpowell29a@gmail.com"
git config --global user.name "Brandon Powell"
git config --global alias.co checkout

# tmux setup
cp .tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "In tmux press `prefix + I` to install plugins"

# zsh
mkdir ~/gopath
cp -R .zsh* ~/

# vim setup
cp -R .vim* ~/
vim -c 'GoInstallBinaries' -c 'q'

# SSH keys for github
ssh-keygen -f ~/.ssh/github
cat ~/.ssh/github.pub | pbcopy
echo "Can now paste key into GitHub"
open "https://github.com/settings/keys"
