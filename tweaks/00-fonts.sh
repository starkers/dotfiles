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

#############################################################

# see: https://github.com/ryanoasis/nerd-fonts/releases

banner installing fonts
VER=v2.1.0

FONTDIR="${XDG_DATA_HOME}/fonts"
try mkdir -p ${FONTDIR}

TMPDIR="$(mktemp -d)" ; try cd ${TMPDIR}

installNerdFont(){
  say "installing NerdFont: ${NAME}  (ver: ${VER})"
  local NAME="$1"
  local fNAME="$1.zip"
  try wget https://github.com/ryanoasis/nerd-fonts/releases/download/${VER}/${fNAME} -c
  try unzip -o "${fNAME}" -d "${FONTDIR}"
  try rm ${FONTDIR}/*Windows*
  try rm ${fNAME}
}

declare -a fonts=(
  Hack
  SourceCodePro
  Terminus
)

for font in "${fonts[@]}"; do
  installNerdFont ${font}
done

try fc-cache -fv
banner done
