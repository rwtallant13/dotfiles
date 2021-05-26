export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config

export PAGER=/usr/bin/less
export MANPAGER="/usr/bin/nvim -c 'set ft=man' -"
export NNN_USE_EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox

export XDG_CURRENT_DESKTOP="GNOME"
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export QT_QPA_PLATFORMTHEME=gtk2
export QT_STYLE_OVERRIDE=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1
export CM_LAUNCHER=rofi
export CM_DIR="$XDG_CACHE_HOME"/clipmenud
export TERMINAL=/usr/bin/alacritty
export SXHKD_SHELL=/usr/bin/bash
export SYSTEMD_EDITOR=nvim

# Path
export PATH=/home/rob/bin:$PATH
export PATH=/usr/lib/elixir/bin:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=/home/rob/.android:$PATH
export PATH=/home/rob/.local/bin:$PATH
export PATH=/home/rob/.go/bin:$PATH
export PATH=/home/rob/.gem/ruby/2.7.0/bin:$PATH
export PATH=/opt/piavpn/bin:$PATH
export PATH="$XDG_DATA_HOME"/cargo/bin:$PATH

# clean home dir
#export FONTCONFIG_PATH="$XDG_DATA_HOME"/fonts
export ATOM_HOME="$XDG_DATA_HOME"/atom
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.config
export CCACHE_DIR=$XDG_CACHE_HOME/ccache
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GOPATH="$XDG_DATA_HOME"/go
export DIFFPROG='nvim -d'
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE=-
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export TERMINFO="$XDG_DATA_HOME"/terminfo
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export RIPGREP_CONFIG_PATH="/home/rob/.config/rgconf"
