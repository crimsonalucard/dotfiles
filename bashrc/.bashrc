export TERM="xterm-256color"
export TERM

#set global vim variables
export VIM="/usr/local/share/nvim"
export VIMRUNTIME="/usr/local/share/nvim/runtime"

set -o emacs

#need to add this to basrhrc to support pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/brian/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

set -o emacs

alias tmux="tmux" 
alias n="sudo n"
#alias nvm="sudo nvm"
alias vim="nvim"
PATH="$HOME/.cabal/bin:$PATH"

#add $HOME/bin to path
export PATH="~/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias ls="ls -laG" 

source ~/.shell_prompt.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="~/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
