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
alias fl='cd "$(locate / | fzf --ansi)"'
alias fd='cd "$(locate "$(pwd)" | fzf --ansi)"'
# alias f='"$(locate / | fzf --ansi)"'
# this function runs whatever comes after with an input from an indexed fzf search
f() {
    "$1" "$(locate / | fzf --ansi --header='$1')"
}
F() {
    "$2" "$(locate '$1' | fzf --ansi)"
}
zypI() {
       sudo zypi "$(echo 'Loading...'; zyps $1 | fzf --ansi -m --prompt='package> ' --header='zypper install')"
}
zypf() {
       # sudo zypi "$(zyps $1 | fzf --header-lines=3 --tac --ansi --delimiter='|' -m --prompt='package> ' --header='zypper search $1' -q $1)"
       zyps $1 | fzf --header-lines=3 --tac --ansi --delimiter='|' -m --prompt='package> ' --header='zypper search $1' -q $1
}
zypF() {
       sudo zypi "$(zyps $1 | fzf --ansi -m --prompt='package> ' --header='zypper search $2' -q $2)"
}

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