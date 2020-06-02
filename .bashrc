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

# exports
export FZF_DEFAULT_OPTS="--reverse --exact --no-color --multi --cycle --border=sharp --height=50% --no-info"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --no-height --exact"
export FZF_CTRL_T_COMMAND="fd . --hidden"
export FZF_ALT_C_COMMAND='fd . --hidden -t d'
export FZF_CTRL_R_OPTS='--exact'
export NNN_PLUG='r:renamer;m:-mediainfo;p:-_less -iR $nnn*'
export NNN_BMS='h:~/;d:~/downloads/;p:/home/rob/pics/;b:/home/rob/.bin/;c:~/.config/;b:/media/blueberry;e:/etc/'
export PF_INFO="ascii title os wm kernel uptime pkgs memory"
