# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  # Plugins
  zgen oh-my-zsh
  zgen oh-my-zsh themes/agnoster
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/heroku
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/tmuxinator
  zgen oh-my-zsh plugins/command-not-found

  # generate the init script from plugins above
  zgen save
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim
export SHELL=zsh

# PATH
PATH=~/.gem/ruby/2.3.0/bin:$PATH

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration
DEFAULT_USER="lsocrate"

# Aliases
source "$HOME/.alias"

# Ignore duplicates on history
setopt HIST_IGNORE_DUPS

# NVM
source /usr/share/nvm/init-nvm.sh

