##########################################################################
# AUTO COMPLETION
##########################################################################

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi

##########################################################################
# VARIABLE
##########################################################################

export SAVEHIST=10000
export HISTSIZE=10000
export EDITOR="nvim"
export PAGER="less"
export BROWSER="brave"
export FILE="lf"
#export READER="zathura"
export SHELL="zsh"
export OPENER="open"
#export DISABLE_UNTRACKED_FILES_DIRTY="true"
#export ZDOTDIR='$HOME/.config/zsh/'
export NOTMUCH_CONFIG="$HOME/.config/notmuch/notmuch-config"

export CMUS_HOME=$HOME/.config/cmus/

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    JAVA_HOME=/usr/lib/jvm/default-java
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
fi

##########################################################################
# PATH
##########################################################################

#export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

##########################################################################
# PYENV
##########################################################################

export PYENV_ROOT="$HOME/.config/pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

##########################################################################
# MAIL
##########################################################################

export EMAIL_ADDRESS_GMAIL="$(pass show Mail/Gmail | awk 'BEGIN{ORS=""} FNR == 2 {print; exit}')"
export EMAIL_ADDRESS_POLITO="$(pass show Mail/Polito | awk 'BEGIN{ORS=""} FNR == 2 {print; exit}')"
