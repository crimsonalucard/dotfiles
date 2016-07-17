#!/usr/bin/env bash

echo "installing dotfiles to home directory..."

#copying hiddent dotfiles
cp -r vimrc/ ~/
cp -r bashrc/ ~/
cp -r tmux/ ~/

#install bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/Vundle.vim && git pull https://github.com/VundleVim/Vundle.vim.git && cd -

#install plugins into vim
vim -c "PluginInstall" -c "q" -c "q" -c "q"

#install airline shellprompt
vim -c "PromptlineSnapshot ~/.shell_prompt.sh" -c "q" -c "q"

#reset bash
source ~/.bashrc

echo "finished installing"





