alias ping.='ping 8.8.8.8'

alias ls='ls --color'
alias l='ls --color -A'

alias pf='ps -fA'
alias pg='ps -fA | grep -i'
alias pG='ps -fA | grep'

alias d='du -d 1 -h'
alias dg='du -d 1 -h | grep'
alias dG='du -d 1 -h | grep -i'
alias dg='du -d 1 -h | grep M'

alias dnfs='sudo dnf search'
alias dnfi='sudo dnf install'
alias dnfu='sudo dnf upgrade'

alias apts='apt search'
alias apti='sudo apt install'
alias aptu='sudo apt update && sudo apt upgrade'
alias aptU='sudo apt upgrade'

alias nmw='nmcli d w'
alias nmd='nmcli d'
alias nm0='nmcli r a off'
alias nm1='nmcli r a on'

alias emstart='emacs --daemon'
alias em='emacsclient -nw'
alias emc='emacsclient -c'
alias emn='emacsclient'

emsu() {
       emacsclient "-nw" "-e" "'(find-file \"/sudo::$1\")'"
}