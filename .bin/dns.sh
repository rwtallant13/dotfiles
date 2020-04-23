#!/usr/bin/env bash

case "$1" in
    -p|pi)
        nmcli con mod Ethernet ipv4.dns "192.168.2.41"
        sudo systemctl restart NetworkManager.service
        ;;
    -c|cloudflare)
        nmcli con mod Ethernet ipv4.dns "1.1.1.1, 1.0.0.1"
        sudo systemctl restart NetworkManager.service
        ;;
    -g|google)
        nmcli con mod Ethernet ipv4.dns "8.8.8.8, 8.8.4.4"
        sudo systemctl restart NetworkManager.service
        ;;
esac
