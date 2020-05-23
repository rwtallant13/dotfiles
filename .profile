export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config

export PAGER=/usr/bin/less
export NNN_USE_EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/chromium

export XDG_CURRENT_DESKTOP="GNOME"
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export QT_QPA_PLATFORMTHEME=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1
export CM_LAUNCHER=rofi
export CM_DIR="$XDG_CACHE_HOME"/clipmenud
export TERMINAL=/usr/bin/termite

# Path
export PATH=/home/rob/.bin:$PATH
export PATH=/usr/lib/elixir/bin:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=/home/rob/.android:$PATH
export PATH=/home/rob/.local/bin:$PATH
export PATH=/opt/:$PATH
export PATH=/home/rob/.go/bin:$PATH
export PATH=/home/rob/.gem/ruby/2.7.0/bin:$PATH
export PATH="$XDG_DATA_HOME"/cargo/bin:$PATH

# clean home dir
#export FONTCONFIG_PATH="$XDG_DATA_HOME"/fonts
export ATOM_HOME="$XDG_DATA_HOME"/atom
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.config
export CCACHE_DIR=$XDG_CACHE_HOME/ccache
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
#export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE=-
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export TERMINFO="$XDG_DATA_HOME"/terminfo
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

#Shell Stuff
export FZF_DEFAULT_OPTS="--reverse --color=bw --multi --cycle --border=sharp"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --no-height --exact"
export FZF_CTRL_T_COMMAND="fd . --hidden"
export FZF_ALT_C_COMMAND='fd . --hidden -t d'
export FZF_CTRL_R_OPTS='--exact'
export NNN_PLUG='r:renamer;m:-mediainfo;p:-_less -iR $nnn*'
export NNN_BMS='h:~/;d:~/downloads/;p:/home/rob/pics/;b:/home/rob/.bin/;c:~/.config/;b:/media/blueberry;e:/etc/'
export PF_INFO="ascii title os wm kernel uptime pkgs memory"

# shortcuts
export bb=/media/blueberry
export media=/media/blueberry/media
export backups=/media/blueberry/backups/rob-pc
export mx100=/media/mx100/
export ssd=/media/ssd/
export bin=/home/rob/.bin

# Commands
if [ $DISPLAY ]; then
    setxkbmap -option caps:escape
fi
