# . /etc/apache2/envvars

 #If not running interactively, don't do anything else
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

if [ $(lsb_release -is) == "Fedora" ]
then
    source /usr/share/git-core/contrib/completion/git-prompt.sh;
elif [ $(lsb_release -is) == "Ubuntu" ]
then
    source /etc/bash_completion.d/git-prompt
elif [ $(lsb_release -is) == "Arch" ]
then
    source /usr/share/git/completion/git-prompt.sh
    source /usr/share/git/git-prompt.sh
elif [ $(lsb_release -is) == "openSUSE" ]
then
     source /etc/bash_completion.d/git-prompt.sh
fi
# source /usr/share/git/git-prompt.sh

# I don't honestly remember what this was for
# PS1='[\[\033[01;32m\]${USER}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 ":%s")] ';
source ~/.ps1rc

cd ~
unset TMUX

if [ $USER == "vatrat" ]; then
    export PATH="/home/vatrat/.gem/ruby/2.3.0/bin:$PATH"
fi

if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
    alias vi='nvim'
    alias vimdiff='nvim -d'
    export EDITOR='nvim'
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

export rvm_silence_path_mismatch_check_flag=1


export TERM=screen-256color

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export LANG=en_US.UTF-8


gdmauth=$XAUTHORITY
unset XAUTHORITY
export XAUTHORITY
xauth merge "$gdmauth"
