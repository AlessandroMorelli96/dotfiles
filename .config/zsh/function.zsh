
# Edit config files
vc() {
    fd --type file . ~/.config | fzf --multi | xargs $EDITOR
}

# pwntools
pwntools() {
    vctl system start
    vctl run --rm --tty --interactive --privileged --volume $PWD/$1:h:/tmp/$1:h pwntools /tmp/$1
    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
        vctl system stop
    fi
}

# gdb
gdb() {
    vctl system start
    vctl run --rm --tty --interactive --privileged --volume $PWD/$1:h:/tmp/$1:h gdb /tmp/$1
    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
        vctl system stop
    fi
}

# ropper
ropper() {
    vctl system start
    vctl run --rm --tty --interactive --privileged --volume $PWD/$1:h:/tmp/$1:h ropper --console --file /tmp/$1
    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
        vctl system stop
    fi
}

# ROPgadget
#ROPgadget() {
#    vctl system start
#    vctl run --rm --volume $(pwd)/$1:h:/work/$1:h robertlarsen/pwntools ROPgadget
#    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
#        vctl system stop
#    fi
#}

# gobuild
gobuild() {
    vctl system start
    vctl run --rm --volume $PWD/$1:h:/tmp/$1:h -w /tmp/$1:h --env GOOS=darwin --env GOARCH=amd64 golang go build -v /tmp/$1
    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
        vctl system stop
    fi
}

# gorun
gorun() {
    vctl system start
    vctl run --rm --volume $PWD/$1:h:/tmp/$1:h golang go run /tmp/$1
    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
        vctl system stop
    fi
}

# pwndocker
#pwndocker() {
#    vctl system start
#    vctl run --rm --volume $PWD/$1:/ctf/work --privileged skysider/pwndocker
#    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
#        vctl system stop
#    fi
#}

# kali
kali() {
    vctl system start
    vctl run --rm -t -i --volume $PWD/:/tmp/ -w /tmp/ kalilinux/kali-bleeding-edge
    if [ -z $(vctl ps | awk 'NR==5 {print $8}') ]; then
        vctl system stop
    fi
}

# Edit project files
vp() {
    fd --type directory --max-depth 1 . ~/Projects/ | fzf | xargs $EDITOR
}

# Better cd
#cd() {
#    builtin cd $@;
#    ls
#}

# Calculate checksum
checksum() {
    if [ -f "$1" ]; then
    basename $1 | sed -e "s/\(.*\)/\1 \\\/"
    md5 $1 | sed -e "s/^MD5.*=/md5/" | sed -e "s/\(.*\)/\1 \\\/"
	openssl sha256 $1 | sed -e "s/^SHA256.*=/sha256/" | sed -e "s/\(.*\)/\1 \\\/"
	openssl rmd160 $1 | sed -e "s/^R.*=/rmd160/"
    else
	echo "Usage: $0 filename"
    fi
}

# Start a simple web server in the current directory
http() {
    local port="${1:-8000}"
    python3 -m http.server
}

# ii:  display useful host related informaton
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

# downloaded file
df() {
    mv $(du -a ~/Downloads/* | awk '{print $2}' | fzf) .
}

# Makedir and cd
mcd() {
    mkdir -p $1
    cd $1
}

# Move to Trash
trash() {
    mv $@ $HOME/.Trash
}

# Better tree visualization
tree() {
    tree -aC --dirsfirst "$@"
}

# Upgrade Repository
uprepos() {
    for tool in $1; do
        if [ -d $tool ]; then
        echo -e "\nUpdating $(basename $tool)"
            cd $tool
            git pull
        fi
    done
}

# vm
vm() {
    
    case $1 in
        list)
            \ls $VIRTUALMACHINES | awk '{print substr($1, 1, length($1)-9)}'
            ;;
        *)
            vmx=$VIRTUALMACHINES/$1.vmwarevm/$1.vmx
            if [ -f $vmx ]; then
                case $2 in
                    delete)
                        vmrun -T fusion delete $vmx
                        ;;
                    copyfrom)
                        scp clownfire@$(vmrun -T fusion getGuestIPAddress $vmx -wait):$3 $4
                        ;;
                    copyto)
                        scp $3 clownfire@$(vmrun -T fusion getGuestIPAddress $vmx -wait):$4
                        ;;
                    start)
                        vmrun -T fusion start $vmx nogui
                        vmrun -T fusion enableSharedFolders $vmx
                        ssh clownfire@$(vmrun -T fusion getGuestIPAddress $vmx -wait)
                        ;;
                    ssh)
                        ssh clownfire@$(vmrun -T fusion getGuestIPAddress $vmx -wait)
                        ;;
                    stop)
                        vmrun -T fusion stop $vmx soft
                        ;;
                    snap)
                        case $3 in
                            list)
                                vmrun -T fusion listSnapshots $vmx showtree
                                ;;
                            save)
                                vmrun -T fusion snapshot $vmx $4
                                ;;
                            restore)
                                vmrun -T fusion revertToSnapshot $vmx $4
                                ;;
                            delete)
                                vmrun -T fusion deleteSnapshot $vmx $4
                                ;;
                            *)
                                echo "ERRORE"
                                ;;
                        esac
                        ;;
                    *)
                        echo "ERRORE"
                        ;;
                esac
            fi
    esac
}
