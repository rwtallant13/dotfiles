#!/usr/bin/env bash

_colors(){
    case "$1" in
        red)
            color="ff0000"
            ;;
        blue)
            color="0000ff"
            ;;
        green)
            color="00ff00"
            ;;
        yellow)
            color="ffff00"
            ;;
        purple)
            color="ff00ff"
            ;;
        white)
            color="ffffff"
            ;;
        *)
            color="$1"
            ;;
    esac
    hue fixed $color
}

opt=${1:-"default"}

case $opt in
    -c|color)
        _colors $2
        ;;
    -d|default)
        hue profile apply rgb
        ;;
    off)
        hue power off
        ;;
esac
