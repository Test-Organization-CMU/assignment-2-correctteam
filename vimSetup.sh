#!/bin/bash

rm -rf ~/.vim
rm ~/.vimrc

ln -s `pwd`/_vim ~/.vim
ln -s `pwd`/_vimrc ~/.vimrc

echo "Vim has been sucessfully setup"
