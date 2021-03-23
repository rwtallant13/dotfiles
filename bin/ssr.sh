#!/bin/bash

help(){
    cat <<- EOF
Usage: ssr.sh [ COMMAND ]

Commands:

    help        print this message
    open	    start ssr in background
    record      start recording screen following cursor

EOF

}

open(){
    2>/dev/null 1>&2 simplescreenrecorder --settingsfile=/home/rob/.ssr/fullscreen.conf &

}

hidden(){
	2>/dev/null 1>&2 simplescreenrecorder --start-hidden --settingsfile=/home/rob/.ssr/fullscreen.conf &

}

record(){
    2>/dev/null 1>&2 simplescreenrecorder --start-hidden --start-recording --settingsfile=/home/rob/.ssr/fullscreen.conf &

}

func=${1:-"open"}

"$func"
