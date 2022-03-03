#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source ${ROOTDIR}/shell-functions

declare -a deps=(
	gsettings
)

for dep in "${deps[@]}"; do
	if ! executableInPath ${dep}; then
		die "please install '${dep}' to continue"
	fi
done
try gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
try gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
try gsettings set org.gnome.desktop.interface clock-show-seconds true

# try dconf write /org/gnome/shell/extensions/nothing-to-say/keybinding-toggle-mute '["<Super>Space", "Pause"]'

# "switch-applications" groups same apps as a single identity and pissed me the fuck off
try gsettings set org.gnome.desktop.wm.keybindings switch-applications []

# use switch-windows for ungrouped alt-tab experience
try gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
