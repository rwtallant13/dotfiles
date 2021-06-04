# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -- general ------------------------------------------------------------------

HISTFILE="$ZDOTDIR/history"
HISTSIZE=100000
SAVEHIST=100000

#PROMPT='%B%F{99}%n@%m%f %F{white}%(3~|…/%2~|%~)%f %B%F{99}%#%F{white} '

# source aliases and functions
[[ -e "$HOME"/.aliases ]] && \
   . "$HOME"/.aliases

# emacs mode
bindkey -e

source "$HOME"/.zkbd/$TERM*

# -- plugins -------------------------------------------------------------

declare -A ZINIT

ZINIT[HOME_DIR]="$HOME"/.config/zsh/zinit
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zcompdump-$ZSH_VERSION

# check zinit is installed
if [[ ! -f $ZINIT[HOME_DIR]/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$ZINIT[HOME_DIR]" && command chmod g-rwX "$ZINIT[HOME_DIR]"
    command git clone https://github.com/zdharma/zinit "$ZINIT[HOME_DIR]/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$ZINIT[HOME_DIR]/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zsh-users/zsh-completions \
				agkozak/zsh-z

zinit ice depth=1; zinit light romkatv/powerlevel10k

# -- compinit ------------------------------------------------------

autoload -Uz compinit && compinit -C -d "$XDG_CACHE_HOME"/zcompdump-$ZSH_VERSION

zinit cdreplay -q

# -- source --------------------------------------------------------

# Load all of your custom configurations from custom/
for config_file ($MYZSH/*.zsh(N)); do
  source $config_file
done
unset config_file

source /usr/share/fzf/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/p10k.zsh ]] || source $ZDOTDIR/p10k.zsh
