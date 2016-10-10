source /usr/share/zsh/scripts/antigen/antigen.zsh

# Oh my zsh!
antigen use oh-my-zsh

# Theme
antigen theme agnoster

# Oh my zsh defaults
antigen bundle git
antigen bundle heroku
antigen bundle nvm
antigen bundle npm
antigen bundle vagrant
antigen bundle cp
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle command-not-found

antigen apply

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

