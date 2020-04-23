#!/bin/bash

kernel="$(efibootmgr | grep "BootCurrent" | cut -d' ' -f2)"

latest="$(efibootmgr | grep "Arch" | grep -v "lts" | tail -n1 | cut -d' ' -f1 | cut -d't' -f2 | tr -d '*')"

lts="$(efibootmgr | grep "lts" | tail -n1 | cut -d' ' -f1 | cut -d't' -f2 | tr -d '*')"



if [[ $kernel == $lts ]]; then
    printf "Switching to latest kernel\n\n"
    sudo efibootmgr -q -a $latest -b $latest
    sudo efibootmgr -q -A $lts -b $lts
elif [[ $kernel == $latest ]]; then
    printf "Switching to lts kernel\n\n"
    sudo efibootmgr -q -a $lts -b $lts
    sudo efibootmgr -q -A $latest -b $latest
elif [[ $kernel != $lts || $kernel != $latest ]]; then
    printf "Current Boot Option is not Arch\n"
    printf "Switching to lts kernel\n\n"
fi

sudo efibootmgr -o 0001,0003,0004,0000
#sudo efibootmgr -Tq
