#!/bin/bash

help(){
    cat <<- EOF
Usage: ssr.sh [ COMMAND ]

Commands:

    help        print this message
    launch      start ssr in background
    record      start recording screen following cursor

EOF

}

launch(){
    2>/dev/null 1>&2 simplescreenrecorder --start-hidden --settingsfile=/home/rob/.ssr/fullscreen.conf &

}

record(){
    2>/dev/null 1>&2 simplescreenrecorder --start-hidden --start-recording --settingsfile=/home/rob/.ssr/fullscreen.conf &

}

func=${1:-"help"}

"$func"
