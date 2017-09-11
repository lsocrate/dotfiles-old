export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "modules/completion", from:prezto
zplug "modules/node", from:prezto
zplug "modules/ssh", from:prezto
zplug "modules/utility", from:prezto
zplug "agnoster/agnoster-zsh-theme", as:theme

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

# PATH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PATH=~/.gem/ruby/2.4.0/bin:$PATH
  source /usr/share/nvm/init-nvm.sh
  # Base16 Shell
  DEFAULT_USER="lsocrate"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DEFAULT_USER="luiz"
  PATH=/Applications/MAMP/bin/php/php7.1.1/bin:$PATH
fi

# CDPATH
CDPATH=~/Projects

# Aliases
source "$HOME/.alias"

# Ignore duplicates on history
setopt HIST_IGNORE_DUPS

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
