#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

source "${ROOTDIR}/shell-functions"
declare -a deps=(
	npm
)

for dep in "${deps[@]}"; do
	if ! executableInPath "${dep}"; then
		die "please install '${dep}' to continue"
	fi
done

#############################################################

declare -a globalPlugins=(
  @bitwarden/cli
)

for data in "${globalPlugins[@]}"; do
	say installing "${data}"
	try npm install -g "${data}"
done
