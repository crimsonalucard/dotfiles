#!/usr/bin/env bash

echo "installing dotfiles to home directory..."

cp -r vimrc/ ~/
cp -r bashrc/ ~/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git pull https://github.com/VundleVim/Vundle.vim.git
vim -c "PluginInstall" -c "q" -c "q" -c "q"

echo "finished installing"





