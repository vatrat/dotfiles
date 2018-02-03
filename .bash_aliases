# This is used to allow aliases to be used with sudo.
# Only the first word of a command is checked for an alias, so
# making sudo into an alias of itself forces checking for more aliases.
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

alias ping.='ping 8.8.8.8'

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

#Network Manager
alias nmw='nmcli d w'
alias nmd='nmcli d'
alias nm0='nmcli r a off'
alias nm1='nmcli r a on'

#Emacs
alias em='emacsclient -nw -a ""'
alias emc='emacsclient -c -a ""'
alias emn='emacsclient -a ""'

alias mcom='picocom -b 115200 --imap lfcrlf -s msend'
alias mcom0='picocom -b 115200 --imap lfcrlf -s msend /dev/ttyUSB0'

emsu() {
       emacsclient "-nw" "-e" "'(find-file \"/sudo::$1\")'"
}
