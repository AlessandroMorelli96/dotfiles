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

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light clvv/fasd
zinit light thetic/extract
zinit light junegunn/fzf
zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zinit light vim/vim

##########################################################################
# THEME
##########################################################################

zinit ice depth=1
zinit light romkatv/powerlevel10k
# dark version
zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme-gruvbox-material-dark
# light version
#zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme-gruvbox-material-light

##########################################################################
# AUTO COMPLETION
##########################################################################
if type brew &>/dev/null; then
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
for file in $HOME/.config/zsh/functions/*; source $file     # Functions
if [[ "$OSTYPE" == "darwin"* ]]; then
    #source $HOME/.config/iterm2/iterm2_shell_integration.zsh
fi

##########################################################################
# VARIABLE
##########################################################################

ZDOTDIR=$HOME/.config/zsh
HISTFILE=$HOME/.config/zsh/zsh_history
SAVEHIST=5000
HISTSIZE=2000
DISABLE_UNTRACKED_FILES_DIRTY="true"
FZF_COMPLETION_TRIGGER='~~'
FZF_COMPLETION_OPTS='+c -x'
FZF_DEFAULT_OPTS='--layout=reverse --height 40% --inline-info -m'
FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export EDITOR='nvim'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    JAVA_HOME=/usr/lib/jvm/default-java
elif [[ "$OSTYPE" == "darwin"* ]]; then
    #GOPATH=$HOME/.config/go                                 # don't forget to change your path correctly!
    #GOROOT=/usr/local/opt/go/libexec
    VIRTUALMACHINES="$HOME/Virtual Machines/"
    MACHINE_DRIVER="vmware"
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

##########################################################################
# OPTION
##########################################################################

setopt AUTO_CD
setopt LOGIN
setopt ZLE
setopt MONITOR
setopt INTERACTIVE
setopt EXTENDED_GLOB
setopt PROMPTSUBST
setopt NO_CASE_GLOB
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY        # share history across multiple zsh sessions
setopt APPEND_HISTORY       # append to history
setopt INC_APPEND_HISTORY   # adds commands as they are typed, not at shell exit
setopt HIST_IGNORE_DUPS     # do not store duplications
setopt HIST_REDUCE_BLANKS   # removes blank lines from history
setopt HIST_VERIFY          # make !! simpler
setopt CORRECT
setopt CORRECT_ALL

##########################################################################
# KEY BINDING
##########################################################################

bindkey '^R' fzf-history-widget

##########################################################################
# PATH
##########################################################################

export PATH="/usr/local/opt/openssl/bin:$PATH"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$HOME/go/bin:$HOME/opt/bin:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # export ANDROID_HOME="/usr/local/Caskroom/android-sdk/4333796"
    # export PATH=$PATH:$ANDROID_HOME/emulator
    # export PATH=$PATH:$ANDROID_HOME/tools
    # export PATH=$PATH:$ANDROID_HOME/tools/bin
    # export PATH=$PATH:$ANDROID_HOME/platform-tools
    # export PATH="$GOPATH/bin:$GOROOT/bin:/usr/local/sbin:$PATH"
    # export PATH=$ANDROID_SDK_ROOT/emulator:$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/build-tools/$(ls $ANDROID_SDK_ROOT/build-tools | sort | tail -1)
    # export PATH="$OPENJDK:$PATH"
fi

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
