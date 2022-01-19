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

declare -a globalPlugins=(
	dive=0.10.0
	dyff=1.4.7
	fd=8.3.1
	kops=v1.21.2
	k9s=0.25.18
	krew=0.4.0
	kubectl=1.21.3
	kubespy=0.5.1
	kustomize=4.3.0
	kubeval=0.16.0
	nodejs=12.14.1
	ripgrep=13.0.0
	shfmt=3.4.2
	starship=1.1.1
	terraform=0.12.29
	terragrunt=0.21.6
	vault=1.7.3
)

declare -a alternativeVersions=(
	nodejs=14.18.3
	nodejs=16.13.2
)

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

for data in ${globalPlugins[@]}; do
	plugin="$(cut -d "=" -f 1 <<<"${data}")"
	# banner $plugin
	ver="$(cut -d "=" -f 2 <<<"${data}")"
	say installing $plugin v${ver}
	if pluginIsInstalled ${plugin}; then
		try asdf plugin add ${plugin}
	else
		say plugin: ${plugin} already added
	fi
	try asdf install ${plugin} ${ver}
	try asdf global ${plugin} ${ver}
done

for data in ${alternativeVersions[@]}; do
	plugin="$(cut -d "=" -f 1 <<<"${data}")"
	# banner $plugin
	ver="$(cut -d "=" -f 2 <<<"${data}")"
	say installing $plugin v${ver}
	if pluginIsInstalled ${plugin}; then
		try asdf plugin add ${plugin}
	else
		say plugin: ${plugin} already added
	fi
	try asdf install ${plugin} ${ver}
done
