#!/usr/bin/env bash

set -x

sleep 4
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &

sleep 4
/usr/lib/xdg-desktop-portal &
