if [[ -f "$HOME/.zplugin/bin/zmodules/Src/zdharma/zplugin.so" ]]; then
    module_path+=( "$HOME/.zplugin/bin/zmodules/Src" )
    zmodload zdharma/zplugin
fi

##########################################################################
# 
##########################################################################
# Useful command similar to xargs
autoload -U zargs

##########################################################################
# PLUGIN
##########################################################################

# Zplugin's installer
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-history-substring-search
zplugin light clvv/fasd
zplugin light thetic/extract
zplugin light junegunn/fzf
zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zplugin light vim/vim

##########################################################################
# THEME
##########################################################################

zplugin light romkatv/powerlevel10k

##########################################################################
# FILE
##########################################################################

source $HOME/.config/zsh/autocomplete.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/p10k.zsh                           # To customize prompt, run "p10k configure"
for file in $HOME/.config/zsh/functions/*; source $file     # Functions
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $HOME/.config/iterm2/iterm2_shell_integration.zsh
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
export EDITOR='nvim'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    JAVA_HOME=/usr/lib/jvm/default-java
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export GOPATH=$HOME/.config/go                                 # don't forget to change your path correctly!
    export GOROOT=/usr/local/opt/go/libexec
    export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
    # export OPENJDK="/usr/local/opt/openjdk/bin"
    VIRTUALMACHINES=$HOME/VirtualMachine/
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
    export PATH="$GOPATH/bin:$GOROOT/bin:/usr/local/sbin:$PATH"
    export PATH=$ANDROID_SDK_ROOT/emulator:$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/build-tools/$(ls $ANDROID_SDK_ROOT/build-tools | sort | tail -1)
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

if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -z "$TMUX" ]] ;then
        ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"    # get the id of a deattached session
        if [[ -z "$ID" ]] ;then                                 # if not available create a new one
            tmux new-session
        else
            tmux attach-session -t "$ID"                        # if available attach to it
        fi
    fi
fi
