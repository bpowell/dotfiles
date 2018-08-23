#!/usr/bin/env zsh

# Setup global gitignore
cp .gitignore ~/
git config --global core.excludesfile ~/.gitignore

# tmux setup
cp .tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "In tmux press `prefix + I` to install plugins"
