if [[ -f "$HOME/.zplugin/bin/zmodules/Src/zdharma/zplugin.so" ]]; then
    module_path+=( "$HOME/.zplugin/bin/zmodules/Src" )
    zmodload zdharma/zplugin
fi

# Useful command similar to xargs
autoload -U zargs

### Added by Zplugin's installer
source '/Users/clownfire/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

### End of Zplugin installer's chunk

# THEME
zplugin light romkatv/powerlevel10k

# PLUGIN
zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zsh-users/zsh-history-substring-search
zplugin light clvv/fasd
zplugin light junegunn/fzf

# FILE
source $HOME/.config/zsh/autocomplete.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.iterm2_shell_integration.zsh
[ -f ~/.config/zsh/fzf.zsh ] && source ~/.config/zsh/fzf.zsh

# VARIABLE
ZDOTDIR=$HOME/.config/zsh
HISTFILE=$ZDOTDIR/zsh_history
SAVEHIST=5000
HISTSIZE=2000
export EDITOR='nvim'
fpath=(
    /usr/local/share/zsh/site-functions
    /usr/local/share/zsh-completions 
    $fpath
)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
export PATH="/usr/local/opt/openssl/bin:$PATH"

