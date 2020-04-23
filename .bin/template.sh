#!/bin/bash
#make templateof filetype
if [[ -n $2 ]]; then
    name=$2
    name="${name%.*}"
else
    _wrongsyntax
fi

_wrongsyntax() {
    printf "error: Incorrect syntax \n"
    printf "Usage: \n \t template.sh [$templatelist] filename \n\n"
    exit 0
}

_checkname() {
if [[ -e /home/rob/.bin/$newfile ]]; then
    printf "Filepath already exists\n"
    read -e -r -p "New filename required:" name
fi
}

_maketemplate() {
    cp $template /home/rob/.bin/$newfile
    printf "# $newfile" >> /home/rob/.bin/$newfile
}


templatelist="$( (cd  /home/rob/.templates/ ; fd . ) | cut -d'.' -f1)"
if [[ $1 == "sh" ]]; then
    template="/home/rob/.templates/sh.sh"
else
    template="$(fd -a $1 /home/rob/.templates)"
fi

ext="${template##*.}"
newfile="$name.$ext"

_checkname

if [[ $templatelist =~ (^|[[:space:]])$1($|[[:space:]]) ]]; then
    _maketemplate
else
    _wrongsyntax
    exit 0
fi

nohup kwrite "/home/rob/.bin/$newfile" >/dev/null 2>&1 & disown
