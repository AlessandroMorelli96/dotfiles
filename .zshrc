# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

##########################################################################
# 
##########################################################################
# Useful command similar to xargs
autoload -U zargs

##########################################################################
# PLUGIN
##########################################################################

#zinit light zsh-users/zsh-autosuggestions
#zinit light zdharma/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab

##########################################################################
# THEME
##########################################################################

zinit ice depth=1
zinit light romkatv/powerlevel10k
zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme-gruvbox-material-dark

##########################################################################
# AUTO COMPLETION
##########################################################################

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi

##########################################################################
# FILE
##########################################################################
source $HOME/.config/zsh/autocomplete.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/p10k.zsh                           # To customize prompt, run "p10k configure"
source $HOME/.config/zsh/function.zsh

##########################################################################
# VARIABLE
##########################################################################

export ZDOTDIR=$HOME/.config/zsh
export SAVEHIST=5000
export HISTSIZE=2000
export DISABLE_UNTRACKED_FILES_DIRTY="true"
export EDITOR='nvim'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    JAVA_HOME=/usr/lib/jvm/default-java
elif [[ "$OSTYPE" == "darwin"* ]]; then
    #VIRTUALMACHINES="$HOME/Virtual Machines/"
    #MACHINE_DRIVER="vmware"
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
fi

##########################################################################
# OPTION
##########################################################################

setopt AUTO_CD
setopt LOGIN
#setopt ZLE
#setopt VI
#setopt MONITOR
#setopt INTERACTIVE
#setopt EXTENDED_GLOB
#setopt PROMPTSUBST
#setopt NO_CASE_GLOB
#setopt EXTENDED_HISTORY
setopt SHARE_HISTORY        # share history across multiple zsh sessions
setopt APPEND_HISTORY       # append to history
setopt INC_APPEND_HISTORY   # adds commands as they are typed, not at shell exit
setopt HIST_IGNORE_DUPS     # do not store duplications
setopt HIST_REDUCE_BLANKS   # removes blank lines from history
#setopt HIST_VERIFY          # make !! simpler
#setopt CORRECT
#setopt CORRECT_ALL

##########################################################################
# KEY BINDING
##########################################################################


##########################################################################
# PATH
##########################################################################

#export PATH="/usr/local/opt/openssl/bin:$PATH"

##########################################################################
# PYENV
##########################################################################

export PYENV_ROOT="$HOME/.config/pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

##########################################################################
# TMUX
##########################################################################

#if [[ "$OSTYPE" == "darwin"* ]]; then
#    if [[ -z "$TMUX" ]] ;then
#        # get the id of a deattached session
#        ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"
#        if [[ -z "$ID" ]] ;then
#            # if not available create a new one
#            tmux new-session
#        else
#            # if available attach to it
#            tmux attach-session -t "$ID"
#        fi
#    fi
#fi
