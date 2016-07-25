#!/usr/bin/env bash

echo "installing dotfiles to home directory..."

if [[ "$OSTYPE" == "darwin"* ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew install vim
  brew install tmux
  brew install ctags
  brew install neovim --with lua
fi


#copying hiddent dotfiles
cp -r vimrc/ ~/
cp -r bashrc/ ~/
cp -r tmux/ ~/
cp -r bash_profile/ ~/

#install powerline fonts
mkdir fonts
cd fonts
git clone https://github.com/powerline/fonts.git 
git pull origin master
./fonts/install.sh
cd -



#install bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/Vundle.vim && git pull https://github.com/VundleVim/Vundle.vim.git && cd -

#install plugins into vim
vim -c "PluginInstall" -c "q" -c "q" -c "q"

#install airline shellprompt
vim -c "PromptlineSnapshot ~/.shell_prompt.sh" -c "q" -c "q"

#reset bash
source ~/.bashrc

tmux

vim -c "q" -c "q"

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

source ~/.shell_prompt.sh

echo "finished installing"

