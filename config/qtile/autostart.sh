#!/bin/sh

#$HOME/.config/polybar/polybar.sh
picom &
/usr/bin/setxkbmap gb &
/usr/bin/setxkbmap -option "terminate:ctrl_alt_bksp" &
# /usr/bin/setxkbmap -layout gb &
/usr/bin/xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 &
/usr/bin/xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" "libinput Tapping Enabled" 1 &
/usr/bin/xinput set-prop "SYNA1D31:00 06CB:CD48 Touchpad" "libinput Tapping Enabled" 1 &
/usr/bin/xinput set-prop "Kingsis Peripherals ZOWIE Gaming mouse" "libinput Accel Profile Enabled" 0, 1 &
/usr/bin/xautolock -time 30 -locker ~/.config/i3/scripts/i3lock.sh &
# blueman-applet &
# wicd-gtk -t &
nm-applet &
# run_keybase -a &
# copyq &
nitrogen --restore &
# obs --minimize-to-tray --startvirtualcam &
