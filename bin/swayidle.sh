#!/bin/sh
# spawn-at-startup "swayidle" "-w" "timeout" "601" "niri msg action power-off-monitors" "timeout" "600" "~/.bin/swaylock.sh" "before-sleep" "~/.bin/swaylock.sh"
#
swayidle -w \
  timeout 300 '~/.bin/swaylock.sh' before-sleep '~/.bin/swaylock.sh' \
  timeout 301 'niri msg action power-off-monitors' \
  timeout 330 'systemctl suspend' before-sleep '~/.bin/swaylock.sh'
# timeout 601 'niri msg action power-off-monitors' before-sleep '~/.bin/swaylock.sh'
# timeout 900 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
# timeout 1800 'systemctl suspend' before-sleep 'swaylock -f -c 000000'
