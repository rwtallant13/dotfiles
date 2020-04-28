HISTFILE=~/.config/zhistory
HISTSIZE=100000
SAVEHIST=100000

# syntax highlighting
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# source .profile for PATH
[[ -f "$HOME"/.profile ]] && \
    . "$HOME"/.profile

# source aliases and functions
[[ -e "$HOME"/.aliases ]] && \
   . "$HOME"/.aliases


#export TERM=xterm-256color

PROMPT='%B%F{blue}%n%f %F{white}%b%c%f %B%F{blue}$ '

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_STYLES[redirection]=fg=yellow

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users

autoload -Uz compinit && compinit -i -d "$XDG_CACHE_HOME"/zsh/zcompdump
autoload bashcompinit && bashcompinit
#setopt ZLE
setopt COMPLETE_ALIASES
setopt EXTENDED_GLOB
setopt NONOMATCH
setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY
zstyle :compinstall filename '/home/rob/.zshrc'

# vim/emacs mode.
#bindkey -v
bindkey -e

source ~/.zkbd/$TERM*

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
bindkey '\e.' insert-last-word
insert-first-word () { zle insert-last-word -- -1 1 }
zle -N insert-first-word
bindkey '^[,' insert-first-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^H' backward-kill-dir
bindkey '^[u' undo
bindkey '^[r' redo
bindkey '5~' kill-whole-line

# source fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
