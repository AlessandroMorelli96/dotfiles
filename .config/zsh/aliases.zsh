##########################################################################
# EDIT FILE
##########################################################################

alias sz='source $HOME/.zshrc'
alias sa='source $HOME/.config/zsh/aliases.zsh'

##########################################################################
# DOTFILE
##########################################################################

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

##########################################################################
# MAKE TERMINAL BETTER
##########################################################################

alias q='exit'
alias ls='ls -FGlAhp'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias c='clear'                             # Clear terminal display
alias show_options='shopt'                  # Show_options: display bash options settings
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias d='dirs -v | head -10'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias top='htop'
fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias objdump='objdump -M Intel'
fi

##########################################################################
# DIRECTORY
##########################################################################

alias uni='cd /Volumes/SSD/buckup/University2020/'

##########################################################################
# NETWORKING
##########################################################################

alias myip='curl ifconfig.me/ip'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets

##########################################################################
# PROGRAMS
##########################################################################

alias tmux='tmux -f ~/.config/tmux/tmux.conf'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias update='brew update && brew upgrade; brew upgrade --cask && brew cleanup'
fi
alias v='nvim'
alias vim='nvim'

##########################################################################
# FILE
##########################################################################

alias -s git='git clone'
alias -s text='nvim'

##########################################################################
# OTHER
##########################################################################

alias wether='curl wttr.in'
