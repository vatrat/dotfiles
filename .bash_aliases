# This is used to allow aliases to be used with sudo.
# Only the first word of a command is checked for an alias, so
# making sudo into an alias of itself forces checking for more aliases.
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

#General
alias ping.='ping 8.8.8.8'
alias dmesg='dmesg --color=always'
alias less='less -R'
alias open='xdg-open'
alias watch='watch -c'
alias acl='bash -c "killall xdotool || while xdotool click --repeat 1000000 --delay 15 1; do :; done"'

#ls redefine
alias ls='ls --color'
alias l='ls --color -A'

#Process listing
alias pf='ps -fA'
alias pg='ps -fA | grep -i'
alias pG='ps -fA | grep'

alias d='du -d 1 -h'
alias dg='du -d 1 -h | grep -i'
alias dG='du -d 1 -h | grep'
alias dk='du -d 1 -h | grep K'
alias dm='du -d 1 -h | grep M'

#Package Managers
#DNF
alias dnfs='sudo dnf search'
alias dnfi='sudo dnf install'
alias dnfu='sudo dnf upgrade'

#APT
alias apts='apt search'
alias apti='sudo apt install'
alias aptu='sudo apt update; sudo apt upgrade'
alias aptU='sudo apt upgrade'

#Zypper
alias zyp='sudo zypper'
alias zyps='sudo zypper se'
alias zypi='sudo zypper in'
alias zypu='sudo zypper up'
alias zypd='sudo zypper dup'
alias zypr='sudo zypper ref'
alias zypp='sudo zypper in -t pattern '

#Network Manager
alias nmw='nmcli d w'
alias nmd='nmcli d'
alias nm0='nmcli r a off'
alias nm1='nmcli r a on'
alias nmr='nmcli r a off && sleep 1 && nmcli r a on && sleep 1 && watch -n 0.7 nmcli d w'
#Networking

noss() { #fast-ish os scan,pulled from internet
	nmap -v -sSU -pT:20-25,80,443-445,U:54321-54330 -O $TARGET
}

#Needs to be greatly improved
mac() {
      sudo nmcli connection modify AU_WiFi wifi.cloned-mac-address $1 &&
      nmcli connection down AU_WiFi &&
      nmcli connection up AU_WiFi &&
      echo "mac address is now " && echo $1;
}

#Emacs
alias em='emacsclient -nw -a ""'
alias emc='emacsclient -c -a ""'
alias emn='emacsclient -a ""'

#Picocom
alias mcom='picocom -b 115200 --imap lfcrlf -s msend'
alias mcom0='picocom -b 115200 --imap lfcrlf -s msend /dev/ttyUSB0'

#fzf
#alias fl='cd "$(locate / | fzf --ansi)"'
alias fd='cd "$(locate "$(pwd)" | fzf --ansi)"'
# alias f='"$(locate / | fzf --ansi)"'
# this function runs whatever comes after with an input from an indexed fzf search
fz() {
    "$2"       "$(locate $1 | fzf --ansi --header='$2')" 
}
fzstat() {
    "stat"     "$(locate $1 | fzf --ansi --header='stat')" 
}
fzcat() {
    "cat"      "$(locate $1 | fzf --ansi --header='cat')" 
}
fzfile() {
    "file"     "$(locate $1 | fzf --ansi --header='file')" 
}
fzcd() {
    "cd"       "$(locate $1 | fzf --ansi --header='cd')" 
}
fzopen() {
    "xdg-open" "$(locate $1 | fzf --ansi --header='open')" 
}
fzecho() {
    "echo"     "$(locate $1 | fzf --ansi --header='echo')" 
}
fzless() {
    "less"     "$(locate $1 | fzf --ansi --header='less')" 
}

fzr() {
    "$1"       "$(locate /  | fzf --ansi --header='$1')" 
}
fzrstat() {
    "stat"     "$(locate /  | fzf --ansi --header='stat')" 
}
fzrcat() {
    "cat"      "$(locate /  | fzf --ansi --header='cat')" 
}
fzrfile() {
    "file"     "$(locate /  | fzf --ansi --header='file')" 
}
fzrcd() {
    "cd"       "$(locate /  | fzf --ansi --header='cd')" 
}
fzropen() {
    "xdg-open" "$(locate /  | fzf --ansi --header='open')" 
}
fzrecho() {
    "echo"     "$(locate /  | fzf --ansi --header='echo')" 
}
fzrless() {
    "less"     "$(locate /  | fzf --ansi --header='less')" 
}

# This section is commented out because, as of right now, mlocate seems to have a bug for btrfs.
# Because /home is mounted on another subvolume, updatedb doesn't index it.
# The option PRUNE_BIND_MOUNTS="no" does not work and has no effect.
# fzh() {
#     "$1"       "$(locate /home/${USER}/  | fzf --ansi --header='$1')" 
# }
# fzhstat() {
#     "stat"     "$(locate /home/${USER}/  | fzf --ansi --header='stat')" 
# }
# fzhcat() {
#     "cat"      "$(locate /home/${USER}/  | fzf --ansi --header='cat')" 
# }
# fzhfile() {
#     "file"     "$(locate /home/${USER}/  | fzf --ansi --header='file')" 
# }
# fzhcd() {
#     "cd"       "$(locate /home/${USER}/  | fzf --ansi --header='cd')" 
# }
# fzhopen() {
#     "xdg-open" "$(locate /home/${USER}/  | fzf --ansi --header='open')" 
# }
# fzhecho() {
#     "echo"     "$(locate /home/${USER}/  | fzf --ansi --header='echo')" 
# }
# fzhless() {
#     "less"     "$(locate /home/${USER}/  | fzf --ansi --header='less')" 
# }

# Temporary workaround using find instead of locate
fzh() {
    "$1"       "$(find /home/${USER}/  | fzf --ansi --header='$1')" 
}
fzhstat() {
    "stat"     "$(find /home/${USER}/  | fzf --ansi --header='stat')" 
}
fzhcat() {
    "cat"      "$(find /home/${USER}/  | fzf --ansi --header='cat')" 
}
fzhfile() {
    "file"     "$(find /home/${USER}/  | fzf --ansi --header='file')" 
}
fzhcd() {
    "cd"       "$(find /home/${USER}/  | fzf --ansi --header='cd')" 
}
fzhopen() {
    "xdg-open" "$(find /home/${USER}/  | fzf --ansi --header='open')" 
}
fzhecho() {
    "echo"     "$(find /home/${USER}/  | fzf --ansi --header='echo')" 
}
fzhless() {
    "less"     "$(find /home/${USER}/  | fzf --ansi --header='less')" 
}

# zypI() {
#     sudo zypi "$(echo 'Loading...'; zyps $1 | fzf --ansi -m --prompt='package> ' --header='zypper install')"
# }
# zypf() {
#     #sudo zypi "$(zyps $1 | fzf --header-lines=3 --tac --ansi --delimiter='|' -m --prompt='package> ' --header='zypper search $1' -q $1)"
#     zyps $1 | fzf --header-lines=3 --tac --ansi --delimiter='|' -m --prompt='package> ' --header='zypper search $1' -q $1
# }
# zypF() {
#     sudo zypi "$(zyps $1 | fzf --ansi -m --prompt='package> ' --header='zypper search $2' -q $2)"
# }

#venv
pve() {
    source .venv/"$1"/bin/activate
}

#General

emsu() {
    emacsclient "-nw" "-e" "'(find-file \"/sudo::$1\")'"
}



blight() {
    sudo su -c "echo $1 > /sys/class/backlight/intel_backlight/brightness"
}

function fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=bash;
    export TF_ALIAS=fuck;
    export TF_SHELL_ALIASES=$(alias);
    export TF_HISTORY=$(fc -ln -10);
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
    ) && eval "$TF_CMD";
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    history -s $TF_CMD;
}

prime-offload() {
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    "$1"
}

trspd() {
    sudo bash -c "echo $1 | tee /sys/devices/platform/i8042/serio1/subsystem/devices/serio2/speed" 
}

trsen() {
    sudo bash -c "echo $1 | tee /sys/devices/platform/i8042/serio1/subsystem/devices/serio2/sensitivity" 
}
