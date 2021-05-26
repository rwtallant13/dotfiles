# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rob/.config/zsh/oh-my-zsh"

# cache dir
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# disable fzf completions
DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins
plugins=(
	adb
	copybuffer
	copydir
	copyfile
	docker
	fast-syntax-highlighting
	fzf
	tmux
	ufw
	zsh-autosuggestions
	zsh-completions
	zsh-z
)

source $ZSH/oh-my-zsh.sh

# User configuration

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^H' backward-kill-dir

autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey "^[/" copy-earlier-word

insert-first-word () { zle insert-last-word -- -1 1 }
zle -N insert-first-word
bindkey '^[,' insert-first-word

export LANG=en_US.UTF-8

export EDITOR='nvim'

source ~/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
