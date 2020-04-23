#
# ~/.bashrc
#

PS1='\[\033[01;94m\]\u\[\033[00;37m\] \W \[\033[01;94m\]\$\[\033[00m\] '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# extended bash completion
[[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# better history search
[[ -f /usr/share/fzf/key-bindings.bash ]] && \
    . /usr/share/fzf/key-bindings.bash

# source .profile for PATH
[[ -f /home/rob/.profile ]] && \
    . /home/rob/.profile

# source aliases and functions
[[ -e ~/.aliases ]] && \
   . ~/.aliases

shopt -s histappend extglob direxpand autocd

# Shell Stuff
export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=/home/rob/.config/bash_history
#. "$HOME"/.bashrc 


if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi

[[ $- == *i* ]] && stty -ixon

