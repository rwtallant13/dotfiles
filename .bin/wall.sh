#!/usr/bin/env bash

set -e

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

_get_file(){
	file="$(realpath "$1")"
}

_update_feh(){
	feh --bg-scale $*
	echo "feh --bg-scale $*" > /home/rob/.fehbg
}

_update_lock(){
    betterlockscreen -r 1920x1200 -u "$1"
}

_update_lightdm(){
	name=$(basename $1)
    pixmap="/usr/share/pixmaps/$name"
    sudo cp $1 $pixmap
    sudo sed -i "/background = /c\background = $pixmap" /etc/lightdm/lightdm-gtk-greeter.conf
}

_update_all() {
	_update_feh "$1"
	_update_lock "$1"
	_update_lightdm "$1"
}


_help(){
    cat <<- EOF
Usage: wall.sh [command] [path]

Commands:
    -f, feh		update feh background
    -d, lightdm		update lightdm background
    -l, lock		update betterlockscreen
    -U, update-all	update wallpaper with selection
    -b, blur		add blurred penrose to wallpaper

EOF
}

_get_file "${@: -1}"

case "$1" in
	-f|feh )
		_update_feh "$file"
		;;
	-d|lightdm )
		_update_lightdm "$file"
		;;
	-l|lock )
		_update_lock "$file"
		;;
	-U|update-all)
        _update_all "$file"
        ;;
	-b|blur)
        _blur "$file"
        ;;
    *)
        _help
        ;;
esac
