
##########################################################################
# PLUGIN
##########################################################################

## Added by Zinit's installer
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
## End of Zinit installer's chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

##########################################################################
# THEME
##########################################################################

zinit ice depth=1
zinit light romkatv/powerlevel10k
zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme-gruvbox-material-dark

##########################################################################
# FILE
##########################################################################

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/variables.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/function.zsh
source $HOME/.config/zsh/p10k.zsh

##########################################################################
# OPTION
##########################################################################

setopt AUTO_CD
setopt LOGIN
setopt SHARE_HISTORY        # share history across multiple zsh sessions
setopt APPEND_HISTORY       # append to history
setopt INC_APPEND_HISTORY   # adds commands as they are typed, not at shell exit
setopt HIST_IGNORE_DUPS     # do not store duplications
setopt HIST_REDUCE_BLANKS   # removes blank lines from history
#setopt HIST_VERIFY          # make !! simpler
#setopt CORRECT
#setopt CORRECT_ALL
#setopt ZLE
#setopt VI
#setopt MONITOR
#setopt INTERACTIVE
#setopt EXTENDED_GLOB
#setopt PROMPTSUBST
#setopt NO_CASE_GLOB
#setopt EXTENDED_HISTORY
