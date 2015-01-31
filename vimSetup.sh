#!/bin/bash

rm -rf ~/.vim
rm ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -r colors ~/.vim/colors
ln -s `pwd`/_vimrc ~/.vimrc

echo "Vim has been sucessfully setup"
