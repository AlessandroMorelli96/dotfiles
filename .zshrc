if [[ -f "$HOME/.zplugin/bin/zmodules/Src/zdharma/zplugin.so" ]]; then
    module_path+=( "$HOME/.zplugin/bin/zmodules/Src" )
    zmodload zdharma/zplugin
fi

# Useful command similar to xargs
autoload -U zargs

### Added by Zplugin's installer
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

### End of Zplugin installer's chunk

# THEME
zplugin light romkatv/powerlevel10k

# PLUGIN
zplugin light zsh-users/zsh-autosuggestions
#zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-history-substring-search
zplugin light clvv/fasd
zplugin light thetic/extract
zplugin light junegunn/fzf
zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zplugin light vim/vim

# FILE
source $HOME/.config/zsh/autocomplete.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/p10k.zsh                           # To customize prompt, run "p10k configure"
for file in $HOME/.config/zsh/functions/*; source $file     # Functions
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $HOME/.iterm2_shell_integration.zsh
fi

# VARIABLE
ZDOTDIR=$HOME/.config/zsh
HISTFILE=$HOME/.config/zsh/zsh_history
SAVEHIST=5000
HISTSIZE=2000
DISABLE_UNTRACKED_FILES_DIRTY="true"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'
export PATH="/usr/local/Cellar/openvpn/2.4.7_1/sbin:$PATH"
export EDITOR='nvim'
fpath=(
    /usr/local/share/zsh/site-functions
    /usr/local/share/zsh-completions 
    $fpath
)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    JAVA_HOME=/usr/lib/jvm/default-java
elif [[ "$OSTYPE" == "darwin"* ]]; then
    VIRTUALMACHINES=$HOME/Virtual\ Machines.localized/
    export GOPATH=${HOME}/.go
    export GOROOT=$(brew --prefix golang)
    export LDFLAGS="-L/usr/local/opt/binutils/lib"
    export CPPFLAGS="-I/usr/local/opt/binutils/include"
    export DYLD_LIBRARY_PATH="/usr/local/opt/unicorn/lib/"
fi


# OPTION
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

# KEY BINDING
bindkey '^R' fzf-history-widget

# PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$HOME/go/bin:$HOME/opt/bin:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:$PATH"
fi 
