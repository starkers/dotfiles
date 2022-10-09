#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source ${ROOTDIR}/shell-functions

declare -a mappings=(
  /com/gexperts/Tilix/
  /org/gnome/desktop/input-sources/
  /org/gnome/desktop/peripherals/keyboard/
  /org/gnome/desktop/wm/
  /org/gnome/settings-daemon/plugins/media-keys/
  /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/
  /org/gnome/shell/extensions/kube-config/
  /org/gnome/shell/extensions/nothing-to-say/
  /org/gnome/desktop/interface/
)

function usage() {
	cat <<EOF

Usage:
  - "$0"       (without arg) will resture dconf settings from disk
  - "$0 dump"  will dump the current settings to disk

EOF
	exit 0
}

try cd ${ROOTDIR}

if [ "X$1" == X ]; then
	for i in ${mappings[@]}; do
		confPath="$(cut -d ":" -f 1 <<<"${i}")"
		confFile="$(echo "${confPath}.dconf" | sed 's+/++1; s+/+_+g; s+_.dconf+.dconf+1')"
		say loading $confPath
		if [ ! -f "${confFile}" ]; then
			err "Error.. config: ${confFile} not found"
			exit 1
		fi
		try dconf load "$confPath" <"$confFile"
	done
elif [ X${1} == Xdump ]; then
	for i in ${mappings[@]}; do
		confPath="$(cut -d ":" -f 1 <<<"${i}")"
		confFile="$(echo "${confPath}.dconf" | sed 's+/++1; s+/+_+g; s+_.dconf+.dconf+1')"
		say dumping $confPath
		set -e
		dconf dump "$confPath" >"$confFile"
		set +e
	done
else
	usage
fi
