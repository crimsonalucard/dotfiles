export TERM="xterm-256color"
export TERM

set -o emacs


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/brian/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

set -o emacs

alias tmux="tmux -2"
alias n="sudo n"
alias nvm="sudo nvm"

PATH="$HOME/.cabal/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


source ~/.shell_prompt.sh
