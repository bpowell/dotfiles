#!/usr/bin/env zsh

if [[ -a ~/.zshrc ]];
then
	echo "Backing up old ~/.zshrc"
	mv ~/.zshrc ~/.zshrc-backup
fi

echo "Creating symlink for ~/.zshrc"
ln -s `pwd`/.zshrc ~/.zshrc

if [[ -d ~/.shellutils ]];
then
	echo "Backing up old ~/.shellutils"
	mv ~/.shellutils ~/.shellutils-backup
fi

echo "Creating symlink for ~/.shellutils"
ln -s `pwd`/.shellutils ~/.shellutils

