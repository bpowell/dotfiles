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

# Setup global gitignore
cp .gitignore ~/
git config --global core.excludesfile ~/.gitignore

# tmux setup
cp .tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "In tmux press `prefix + I` to install plugins"

# vim setup
cp -R .vim* ~/

# zsh
cp -R .zsh* ~/
