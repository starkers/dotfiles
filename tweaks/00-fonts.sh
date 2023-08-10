#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

source ${ROOTDIR}/shell-functions
declare -a deps=(
	fc-cache
	unzip
	wget
)

for dep in "${deps[@]}"; do
	if ! executableInPath ${dep}; then
		die "please install '${dep}' to continue"
	fi
done
set -u

#############################################################

# see: https://github.com/ryanoasis/nerd-fonts/releases

banner installing fonts
VER=v2.1.0

## where to store the fonts after install
FONTDIR="${XDG_DATA_HOME:-~/.local/share/}fonts"
try mkdir -p ${FONTDIR}

# storing the downloaded .zip files (to make the script idempotent)

FONTSTORAGE="${HOME}/.font_storage/NerdFonts-${VER}"
try mkdir -p "${FONTSTORAGE}"
try cd "${FONTSTORAGE}"

installNerdFont() {
	local NAME="$1"
	local fNAME="$1.zip"
	say "installing NerdFont: ${NAME}  (ver: ${VER})"

	# download
	try wget -q --show-progress -c "https://github.com/ryanoasis/nerd-fonts/releases/download/${VER}/${fNAME}" -O "${fNAME}"

	# decompress
	try unzip -o "${fNAME}" -d "${FONTDIR}"

	## delete crap
	try find "${FONTDIR}" -name '*Windows Compatible*' -delete

	## cleanup the downloaded .zip file
}

declare -a fonts=(
	DroidSansMono
	# FiraCode
	FiraMono
	# Go-Mono
	Hack
	# Hermit
	# Meslo
	# Noto
	SourceCodePro
	Terminus
	# UbuntuMono
)

for font in "${fonts[@]}"; do
	installNerdFont ${font}
done

## copy in my personal (paid-for) fonts
#- https://tosche.net/fonts/comic-code
#- https://fonts.ilovetypography.com/fonts/tabular-type-foundry/comic-code

# try cp /keybase/private/starkers/fonts/* ${FONTDIR}
try fc-cache -f
banner done
