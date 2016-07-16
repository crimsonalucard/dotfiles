#!/usr/bin/env bash

echo "installing dotfiles to home directory..."

cp -r vimrc/ ~/
cp -r bashrc/ ~/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim






