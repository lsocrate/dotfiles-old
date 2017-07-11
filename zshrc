# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  # Plugins
  zgen prezto

  zgen prezto prompt theme 'agnoster'

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

# PATH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PATH=~/.gem/ruby/2.4.0/bin:$PATH
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
fi

# CDPATH
CDPATH=~/Projects

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# User configuration
DEFAULT_USER="lsocrate"


# Aliases
source "$HOME/.alias"

# Ignore duplicates on history
setopt HIST_IGNORE_DUPS

# NVM
source /usr/share/nvm/init-nvm.sh

