if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export ZPLUG_HOME=/usr/share/zsh/scripts/zplug
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export ZPLUG_HOME=/usr/local/opt/zplug
fi

source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "modules/completion", from:prezto
zplug "modules/node", from:prezto
zplug "modules/ssh", from:prezto
zplug "modules/utility", from:prezto
zplug "agnoster/agnoster-zsh-theme", as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export EDITOR=nvim
export SHELL=zsh

unalias rm

BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000                 #How many lines of history to keep in memory
HISTFILE="$HOME/.zsh_history" #Where to save history to disk
SAVEHIST=5000                 #Number of history entries to save to disk
HISTDUP=erase                 #Erase duplicates in the history file
setopt    appendhistory       #Append history to the history file (no overwriting)
setopt    sharehistory        #Share history across terminals
setopt    incappendhistory    #Immediately append to the history file, not just when a term is killed

# PATH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  DEFAULT_USER="lsocrate"
  PATH=~/.gem/ruby/2.4.0/bin:$PATH
  source /usr/share/nvm/init-nvm.sh
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DEFAULT_USER="luiz"
  PATH=/Applications/MAMP/bin/php/php7.1.1/bin:$PATH
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # CABAL
  export PATH="$HOME/Library/Haskell/bin:$PATH"
fi

# CDPATH
CDPATH=~/Projects

# Aliases
source "$HOME/.alias"

# Ignore duplicates on history
setopt HIST_IGNORE_DUPS

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"


# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
