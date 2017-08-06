# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  # Plugins
  zgen prezto


  zgen prezto archive
  zgen prezto command-not-found
  zgen prezto completion
  zgen prezto git
  zgen prezto node
  zgen prezto pacman
  zgen prezto ssh
  zgen prezto tmux
  zgen prezto utility

  # generate the init script from plugins above
  zgen save
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim
export SHELL=zsh

BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# PATH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PATH=~/.gem/ruby/2.4.0/bin:$PATH
  source /usr/share/nvm/init-nvm.sh
  # Base16 Shell
  DEFAULT_USER="lsocrate"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DEFAULT_USER="luiz"
  prompt agnoster
fi

# CDPATH
CDPATH=~/Projects

# Aliases
source "$HOME/.alias"

# Ignore duplicates on history
setopt HIST_IGNORE_DUPS

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
