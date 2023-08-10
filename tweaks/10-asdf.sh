#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

source "${ROOTDIR}/shell-functions"
declare -a deps=(
	asdf
)

for dep in "${deps[@]}"; do
	if ! executableInPath "${dep}"; then
		die "please install '${dep}' to continue"
	fi
done

function pluginIsInstalled() {
	data="$(asdf plugin list)"
	grep -q ${@} <<<${data}
	RC="$?"
	if [ $RC == 0 ]; then
		return 1
	else
		return 0
	fi
}

# This script loops over all version in ~/.tool-versions and:
# - installs/activates them
# - sets them as default/global
count=1
for data in $(cat ~/.tool-versions); do
	((count = count + 1))
	if ((count % 2 == 0)); then
		plugin="$(echo "${data}" | cut -d " " -f 1)"
	else
		ver="$(echo "${data}" | cut -d " " -f 2)"
		banner $plugin
		say installing $plugin ver: ${ver}

		if pluginIsInstalled ${plugin}; then
			try asdf plugin add ${plugin}
		else
			say plugin: ${plugin} already added
		fi
		try asdf install ${plugin} ${ver}
		try asdf global ${plugin} ${ver}
	fi
done
