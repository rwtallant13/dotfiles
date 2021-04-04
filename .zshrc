# -- general ------------------------------------------------------------------

HISTFILE=~/.config/zsh/history
HISTSIZE=100000
SAVEHIST=100000

PROMPT='%B%F{33}%n%f %F{white}%(3~|…/%2~|%~)%f %B%F{33}%# '
#PROMPT="%(5~|%-1~/…/%3~|%4~)"


# source aliases and functions
[[ -e ~/.aliases ]] && \
   . ~/.aliases

autoload -Uz compinit && compinit -C -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
autoload bashcompinit && bashcompinit

# emacs mode
bindkey -e

source ~/.zkbd/$TERM*


# -- plugins ------------------------------------------------------------------
declare -A ZINIT

ZINIT[HOME_DIR]="$HOME"/.config/zsh/zinit
ZINIT[ZCOMPDUMP_PATH]="$HOME"/.config/zsh/zinit/


source ~/.config/zsh/zinit/bin/zinit.zsh

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# -- syntax highlighting ------------------------------------------------------

ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan,underline'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold,underline'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=green,bold,underline'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f6569,bg=bold,underline"

# -- autosuggestions ----------------------------------------------------------

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char})
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

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
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle :compinstall filename '/home/rob/.zshrc'

# -- setopts ------------------------------------------------------------------

#setopt ZLE
setopt complete_aliases
setopt extended_glob
setopt nonomatch
setopt auto_cd
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt inc_append_history
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""



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

bindkey '^[[1;5B' autosuggest-clear
bindkey '^[[1;5A' autosuggest-execute

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

function expand-or-complete-or-list-files() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="ls "
        CURSOR=3
        zle list-choices
        zle backward-kill-word
    else
        zle expand-or-complete
    fi
}
zle -N expand-or-complete-or-list-files
bindkey '^I' expand-or-complete-or-list-files

exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# -- exports -------------------------------------------------------

export FZF_DEFAULT_OPTS="--preview-window noborder --reverse --exact --no-color --multi --cycle --border=sharp --height=50% --no-info"
#export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50' --exact"
export FZF_CTRL_T_COMMAND="fd . --hidden"
export FZF_ALT_C_COMMAND='fd . --hidden -t d -t l'
export FZF_CTRL_R_OPTS='--exact'
export _ZL_DATA=/home/rob/.config/zlua
export _ZL_ECHO=1


# -- source --------------------------------------------------------

source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh
eval "$(lua ~/.local/share/z.lua/z.lua --init zsh enhanced once)"
