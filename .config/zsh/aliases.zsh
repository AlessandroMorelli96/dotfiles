##########################################################################
# EDIT FILE
##########################################################################

alias sz='source $HOME/.zshrc'
alias sa='source $HOME/.config/zsh/aliases.zsh'
alias vv='vim $HOME/.config/nvim/init.vim'
alias va='vim $HOME/.config/zsh/aliases.zsh'
alias vz='vim $HOME/.zshrc'
alias vb='vim $HOME/.config/homebrew/Brewfile'
alias vt='vim $HOME/.config/tmux/tmux.conf'

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
alias c='clear'                             # c:            Clear terminal display
#alias which='type --all'                    # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias d='dirs -v | head -10'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias top='htop'
fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias objdump='objdump -M Intel'
    #alias gdb='gdb -q'
fi

##########################################################################
# PROCESS MANAGEMENT
##########################################################################

alias ttop="top -R -F -s 10 -o rsize"                                       # ttop:  Recommended 'top' invocation to minimize resources
alias myps='ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command'

##########################################################################
# NETWORKING
##########################################################################

alias myip='curl ifconfig.me/ip'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

##########################################################################
# PROGRAMS
##########################################################################

alias pw="fzf --preview 'bat --color \"always\" {}'"    # fzf preview
alias vim='nvim'
alias vimdiff='nvim -d'
alias tmux='tmux -f ~/.config/tmux/tmux.conf'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias update='brew update && brew upgrade; brew cask upgrade && brew cleanup'
fi

##########################################################################
# FILE
##########################################################################

alias -s git='git clone'
alias -s text='vim'

##########################################################################
# DOCKER
##########################################################################

alias juicy-shop='docker run --rm -p 3000:3000 bkimminich/juice-shop'
alias msfconsole='~/Projects/dockers/metasploit/docker/bin/msfconsole'
alias msfvenom='~/Projects/docker/metasploit/docker/bin/msfvenom'
# alias cyberchef='docker run --rm -p 8080:8080 remnux/cyberchef'
alias python="docker run --rm -it -v $(pwd)/$1:/tmp/$1 python /tmp/$1"
alias shellcraft='docker run --rm robertlarsen/pwntools shellcraft'
alias constgrep='docker run --rm robertlarsen/pwntools constgrep'
alias cyclic='docker run --rm robertlarsen/pwntools cyclic'
