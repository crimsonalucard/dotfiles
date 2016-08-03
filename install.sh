#!/usr/bin/env bash

echo "installing dotfiles to home directory..."

if [[ "$OSTYPE" == "darwin"* ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew install vim --with lua
  brew install tmux
  brew install ctags
  brew install neovim 
  brew install python3
  pip3 install neovim
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
rm -rd fonts



#install bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/Vundle.vim && git pull https://github.com/VundleVim/Vundle.vim.git && cd -

#install plugins into vim
vim -c "PluginInstall" -c "q" -c "q" -c "q"

#install airline shellprompt
vim -c "PromptlineSnapshot ~/.shell_prompt.sh" -c "q" -c "q"

#get deoplete working for neovim
vim -c "UpdateRemotePlugins"

#install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#reset bash
source ~/.bashrc

tmux source ~/.tmux.conf

vim -c "q" -c "q"

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

source ~/.shell_prompt.sh

echo "finished installing"
echo "if you are using iTerm2, to get 'alt ->' or 'alt <-' working you need to load a preset in the keys tab of the running profile to \"Natural Text Editing"
