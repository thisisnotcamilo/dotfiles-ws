#!/bin/bash

select="Shutdown\nReboot"

selected=$(echo -e "$select" | dmenu -p 'Do you want to?' -i -fn 'Source Code Pro-9' -nb '#000000' -nf '#ffffff' -sb '#222222' -sf '#ffffff')

case "$selected" in
    Shutdown) shutdown ;;
    Reboot) reboot ;;
esac
