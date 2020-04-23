#!/usr/bin/env bash

currentDir="/home/rob/pics/backgrounds/current/"

_blur() {
    wall="$1"
    echo "$wall"
    logo="/home/rob/pics/other/penrosetriangle-white-wider-blackgray-alt.png"

    # Get the res of the wallpaper
    height=$(magick convert "$wall" -format "%h" info:)
    width=$(magick convert "$wall" -format "%w" info:)

    # Calculate height for logo
    logo_height=$(($height/3))

    # Generate logo
    convert "$logo" -gravity center -resize $logo_height -background white -extent "${width}x${height}" -flatten "temp_logo.png"


    # Generate wallpaper
    outfile_name="blurred_$(basename "$wall")"

    convert "$wall" -write-mask "temp_logo.png" -gravity center \
        -gaussian-blur 0x12 \
        -evaluate Multiply 1.8 \
        $outfile_name

    mv $outfile_name /home/rob/pics/backgrounds/blurred/

    # Delete temporary file
    rm "temp_logo.png"
}
_update() {
    feh --bg-fill $1 --bg-fill $1 --bg-fill $1

    betterlockscreen -r 1920x1200 -u "$1"

    name=$(basename $1)
    pixmap="/usr/share/pixmaps/$name"
    sudo cp $1 $pixmap
    sudo sed -i "/background = /c\background = $pixmap" /etc/lightdm/lightdm-gtk-greeter.conf
}

_new() {
    wall="$(fd -a . ~/pics/backgrounds/current/ | shuf -n 1)"
    _update "$wall"
}

_addCurrent() {
    for var in "$*"; do
        path="$(realpath "$var")"
        ln -s "$path" "$currentDir"
    done
}

_clearCurrent(){
    fd . "$currentDir" -t l --exec unlink
}

_help(){
    cat <<- EOF
Usage: wall.sh [command] [path(s)]

Commands:
    -u, update      update wallpaper with selection
    -b, blur        add blurred penrose to wallpaper
    -a, add         add wallpaper(s) to current dir
    -n, new         select new wallpaper from currentWall dir
    -c, clear       clear all links in currentWall dir

EOF
}

case "$1" in
    -u|update)
        _update "$2"
        ;;
    -n|new)
        _new "$2"
        ;;
    -b|blur)
        _blur "$2"
        ;;
    -a|add)
        _addCurrent "${*:2}"
        ;;
    -c|clear)
        _clearCurrent
        ;;
    *)
        _help
        ;;
esac
