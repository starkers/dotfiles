#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

source ${ROOTDIR}/shell-functions
declare -a deps=(
  go
  git
)

for dep in "${deps[@]}"; do
  if ! executableInPath ${dep}; then
    die "please install '${dep}' to continue"
  fi
done

#############################################################

declare -a globalPlugins=(
  github.com/starkers/ggg
)



for data in ${globalPlugins[@]}; do
  say installing $data
  try go get -x ${data}
done

