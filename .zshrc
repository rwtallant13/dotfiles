# -- general ------------------------------------------------------------------

HISTFILE="$HOME"/.config/zsh/history
HISTSIZE=100000
SAVEHIST=100000

PROMPT='%B%F{33}%n@%m%f %F{white}%(3~|…/%2~|%~)%f %B%F{33}%# '

# source aliases and functions
[[ -e "$HOME"/.aliases ]] && \
   . "$HOME"/.aliases

# emacs mode
bindkey -e

source "$HOME"/.zkbd/$TERM*


# -- autosuggestions ----------------------------------------------------------

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
#ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char})
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f6569,bg=bold,underline"

# -- completion ---------------------------------------------------------------

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zcompcache
zstyle :compinstall filename '/home/rob/.zshrc'

# -- setopts ------------------------------------------------------------------

setopt   extended_glob \
		 nonomatch \
		 auto_cd \
		 hist_ignore_all_dups \
		 hist_save_no_dups \
		 hist_expire_dups_first \
		 inc_append_history \
		 automenu \
		 always_to_end \
		 complete_in_word \
		 PROMPT_CR \
		 PROMPT_SP
unsetopt menucomplete

export PROMPT_EOL_MARK=""
DISABLE_AUTO_TITLE="true"

function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

# -- keybinds ---------------------------------------------------------

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

bindkey '5~' kill-whole-line
bindkey '^[u' undo
bindkey '^[r' redo

bindkey '\e.' insert-last-word

insert-first-word () { zle insert-last-word -- -1 1 }
zle -N insert-first-word
bindkey '^[,' insert-first-word

autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey "^[/" copy-earlier-word

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^H' backward-kill-dir

exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh


# -- fzf

export FZF_DEFAULT_OPTS="--preview-window noborder --no-color --reverse --exact --multi --cycle --border=sharp --height=50% --no-info --color=spinner:#89DDFF,hl:#82AAFF --color=fg:#d6d6d6,header:#82AAFF,info:#FFCB6B,pointer:#89DDFF --color=marker:#89DDFF,fg+:#EEFFFF,prompt:#FFCB6B,hl+:#82AAFF"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50' --exact"
export FZF_CTRL_T_COMMAND="fd . --hidden"
export FZF_ALT_C_COMMAND='fd . --hidden -t d -t l'
export FZF_CTRL_R_OPTS='--exact'

# -- zsh-z
export ZSHZ_DATA='/home/rob/.local/share/zsh-z/z'
export ZSHZ_KEEP_DIRS=( /drives/blueberry )
export ZSHZ_ECHO=1

# -- source -------------------------------------------------

source /usr/share/fzf/key-bindings.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# -- plugins -------------------------------------------------
declare -A ZINIT

ZINIT[HOME_DIR]="$HOME"/.config/zsh/zinit
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zcompdump-$ZSH_VERSION

source "$HOME"/.config/zsh/zinit/bin/zinit.zsh

# Load using the for-syntax
zinit wait lucid for \
	agkozak/zsh-z
zinit wait lucid for \
    zsh-users/zsh-autosuggestions
zinit wait lucid for \
    zsh-users/zsh-completions
zinit wait lucid for \
	NullSense/fuzzy-sys

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zdharma/fast-syntax-highlighting

# -- compinit -------------------------------------------------

autoload -Uz compinit && compinit -C -d "$XDG_CACHE_HOME"/zcompdump-$ZSH_VERSION
autoload bashcompinit && bashcompinit

zinit cdreplay -q
