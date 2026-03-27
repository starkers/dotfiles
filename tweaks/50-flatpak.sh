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
  net.cozic.joplin_desktop
  com.jetpackduba.Gitnuro
  # com.bitwarden.desktop
  # com.discordapp.Discord
  # de.shorsh.discord-screenaudio
  # com.slack.Slack
  dev.aunetx.deezer
  # dev.alextren.Spot
  # us.zoom.Zoom
  # com.jetbrains.GoLand
  # com.mattjakeman.ExtensionManager
  # com.github.IsmaelMartinez.teams_for_linux
)

try flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

for x in "${flathub[@]}"; do
  try flatpak install -y flathub ${x}
done
