#!/usr/bin/env bash

echo "installing dotfiles to home directory..."
echo "installing and updating brew"
if [[ "$OSTYPE" == "darwin"* ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew install vim --with lua
  brew install tmux
  brew install pyenv
  brew install ctags
  brew install neovim 
  brew install python3
  brew install python2
  pip2 install neovim
  pip3 install neovim
fi

curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
pyenv update
pyenv install 2.7
pyenv install 3.5.2
pyenv virtualenv 2.7 neovim2
pyenv virtualenv 3.5.2 neovim3



echo "copying hidden dotfiles"
#copying hidden dotfiles
cp -r vimrc/ ~/
cp -r bashrc/ ~/
cp -r tmux/ ~/
cp -r bash_profile/ ~/
mkdir ~/bin
cp -r bin/ ~/bin

echo "installing powerline fonts"
#install powerline fonts
mkdir fonts
cd fonts
git clone https://github.com/powerline/fonts.git
git pull origin master
./fonts/install.sh
cd -
sudo rm -rd fonts



#install bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/Vundle.vim && git pull https://github.com/VundleVim/Vundle.vim.git && cd -

#install plugins into vim
vim -c "PluginInstall" -c "q" -c "q" -c "q"

#install airline shellprompt
rm -f ~/.shell_prompt.sh
vim -c "PromptlineSnapshot ~/.shell_prompt.sh" -c "q" -c "q"

#get deoplete working for neovim
#vim -c "UpdateRemotePlugins"

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

echo 'please run manually to bootstrap neovim:'
echo 'pyenv activate neovim2'
echo 'pip install neovim'
echo 'pyenv which python'
echo 'pyenv activate neovim3'
echo 'pip install neovim'
echo 'pyenv which python'

