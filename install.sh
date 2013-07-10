#!/usr/bin/env zsh

files=".zshrc .vimrc .vim .tmux.conf .shellutils"
for file in $files; do
	echo "Creating symlink for $file."
	ln -s $file $HOME/$file
done
