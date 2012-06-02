#!/bin/sh

REPO=http://github.com/pix0r/dotvim.git

cd $HOME
if [ ! -d ".vim" ]; then
	git clone --recursive $REPO .vim
	cp .vim/vimrc .vimrc
else
	echo "Error: $HOME/.vim already exists"
	exit 1
fi
