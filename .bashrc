[ -z "$PS1" ] && return #If not running interactively, don't do anything else

# History
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=300000
SAVEHIST=300000
HISTFILE=/xfsdata/.bash_history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
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


# PS1RC git branch indicator needs git-prompt.sh, which is not in a standard location
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
     source /etc/bash_completion.d/git-prompt
fi
# source /usr/share/git/git-prompt.sh

# I don't honestly remember what this was for
# PS1='[\[\033[01;32m\]${USER}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 ":%s")] ';
source ~/.ps1rc

# Is this needed? It seems like it might get in the way
cd ~

# idk
unset TMUX

# set nvim as vim
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
    alias vi='nvim'
    alias vimdiff='nvim -d'
    export EDITOR='nvim'
fi


# ???
export rvm_silence_path_mismatch_check_flag=1

# color compatibility ig
export TERM=screen-256color

# fzf 
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# english
export LANG=en_US.UTF-8


# broken, don't remember what it did
# gdmauth=$XAUTHORITY
# unset XAUTHORITY
# export XAUTHORITY
# xauth merge "$gdmauth"

# make man not unreadabale when resizing terminals by making it smol
export MANWIDTH=80
# prefer non-POSIX manpages
export MAN_POSIXLY_CORRECT=0
# try to force emacs to use ONE server file
# so that restart-emacs(-resume-layouts) doesn't result in a socketless emacs
export EMACS_SERVER_SOCKET=/run/user/$(id -u)/emacs/server
export EMACS_SOCKET_NAME=/run/user/$(id -u)/emacs/server
#source /home/$(id -un)/code/python/venv/jupyter/bin/activate


# set up ARM toolchain
export PATH="/opt/arm-gnu-toolchain-12.3/bin:$PATH"
# arm-none-eabi-gdb needs python3.8 specifically for some reason
# export PYTHONPATH=/usr/lib64/python3.8 && export PYTHONHOME=/usr/bin/python3.8
MANPATH=/opt/arm-gnu-toolchain-12.3/share/man:$MANPATH;export MANPATH
## TMUX auto attach
##
if which tmux >/dev/null 2>&1; then                 # check if tmux is installed
    if [[ ! $TERM_PROGRAM =~ "tmux" ]] ;then                   # do not allow "tmux in tmux"
	    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"    # get the id of a deattached session
	    if [[ -z "$ID" ]] ;then                                 # if not available create a new one
		    exec tmux new-session
	    else
		    exec tmux attach-session -t "$ID"                    # if available, attach to it
	    fi
    fi
fi
