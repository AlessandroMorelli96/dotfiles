#   -----------------------------
	#   2.  MAKE TERMINAL BETTER
	#   -----------------------------

    alias sz='source $HOME/.zshrc'
    alias sa='source $HOME/.config/zsh/.oh-my-zsh/custom/aliases.zsh'
    alias vv='vim $HOME/.config/nvim/init.vim'
    alias va='vim $HOME/.oh-my-zsh/custom/aliases.zsh'
	alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
	alias vz='vim $HOME/.zshrc'
	alias q='exit'
	alias ls='ls -FGlAhp'
	alias cp='cp -iv'                           # Preferred 'cp' implementation
	alias mv='mv -iv'                           # Preferred 'mv' implementation
	alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
	alias less='less -FSRXc'                    # Preferred 'less' implementation
	cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
	alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
	alias ..='cd ../'                           # Go back 1 directory level
	alias c='clear'                             # c:            Clear terminal display
	#alias which='type --all'                    # which:        Find executables
	alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
	alias show_options='shopt'                  # Show_options: display bash options settings
	mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
	trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

	#   ---------------------------
	#   5.  PROCESS MANAGEMENT
	#   ---------------------------

	#   ttop:  Recommended 'top' invocation to minimize resources
	#   ------------------------------------------------------------
	alias ttop="top -R -F -s 10 -o rsize"

	#   my_ps: List processes owned by my user:
	#   ------------------------------------------------------------
	my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

	#   ---------------------------
	#   6.  NETWORKING
	#   ---------------------------

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

	#   ii:  display useful host related informaton
	#   -------------------------------------------------------------------
	ii() {
	    echo -e "\nYou are logged on ${RED}$HOST"
	    echo -e "\nAdditionnal information:$NC " ; uname -a
	    echo -e "\n${RED}Users logged on:$NC " ; w -h
	    echo -e "\n${RED}Current date :$NC " ; date
	    echo -e "\n${RED}Machine stats :$NC " ; uptime
	    echo -e "\n${RED}Current network location :$NC " ; scselect
	    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
	    echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
	    echo
	}
	#   ---------------------------------------
	#   9.  DOCKER
	#   ---------------------------------------

	#alias nmap='docker run --rm --net=host --privileged kali-box nmap'
	#alias kali='docker run -it --rm --net=host --privileged -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority kali-box /bin/bash -c "tmux"'
	#alias setoolkit='docker run --rm -ti kali-box setoolkit'
	#alias hydra='docker run --rm -ti kali-box hydra'
	#alias kali-install='/Users/clownfire/opt/installOnKali.py'
	#alias shodan='docker run --rm -ti kali-box shodan'
	#alias gdb='docker run --rm -ti kali-box gdb'

	#   ---------------------------------------
	#   10.  PROGRAMS
	#   ---------------------------------------


    kali1(){
        cd ~/VirtualBox\ VMs/kali;
        export DISPLAY=:0;
        vagrant up;
        vagrant ssh;
    }
    alias kali='cd ~/VirtualBox\ VMs/kali; export DISPLAY=:0 && vagrant up && vagrant ssh'

    alias vim='nvim'
	alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
	alias proxychains='proxychains4'
