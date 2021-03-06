#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source ${ROOTDIR}/shell-functions

declare -a deps=(
	flatpak
)

for dep in "${deps[@]}"; do
	if ! executableInPath ${dep}; then
		die "please install '${dep}' to continue"
	fi
done

declare -a flathub=(
	com.axosoft.GitKraken
	com.bitwarden.desktop
	com.discordapp.Discord
	com.slack.Slack
	com.spotify.Client
	us.zoom.Zoom
)

try flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

for x in "${flathub[@]}"; do
	try flatpak install -y flathub ${x}
done
