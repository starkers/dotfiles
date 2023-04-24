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

#############################################################

declare -a globalPlugins=(
	# bat 0.19.0
	deno 1.26.1
	dive 0.10.0
	direnv 2.32.1
	# dyff 1.4.7
	fd 8.3.1
	fzf 0.29.0
	golang 1.19.7
	golangci-lint 1.51.2
	helm 3.7.2
	jq 1.6
	k9s 0.25.18
	# kops v1.21.2
	# krew 0.4.0
	kubectl 1.21.11
	kubespy 0.5.1
	kubeval 0.16.0
	kustomize 4.3.0
	ripgrep 13.0.0
	shellcheck 0.7.2
	shfmt 3.4.2
	sops 3.7.3
	stylua 0.14.1
	starship 1.13.1
	stern 1.20.1
	terraform 1.3.6
	terragrunt 0.42.3
	# vault 1.7.3
	zoxide 0.8.3
	yq 4.27.2
)

declare -a alternativeVersions=(
	# nodejs 14.18.3
	# nodejs 16.13.2
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

count=0
for data in ${globalPlugins[@]}; do
	count=$((count + 1))
	if [ $count == 1 ]; then
		plugin=${data}
	fi
	if [ $count == 2 ]; then
		count=0
		ver=${data}
		banner $plugin
		say installing $plugin v${ver}
		if pluginIsInstalled ${plugin}; then
			try asdf plugin add ${plugin}
		else
			say plugin: ${plugin} already added
		fi
		try asdf install ${plugin} ${ver}
		try asdf global ${plugin} ${ver}
	fi
done

count=0
for data in ${alternativeVersions[@]}; do
	count=$((count + 1))
	if [ $count == 1 ]; then
		plugin=${data}
	fi
	if [ $count == 2 ]; then
		count=0
		ver=${data}
		say installing $plugin v${ver}
		if pluginIsInstalled ${plugin}; then
			try asdf plugin add ${plugin}
		else
			say plugin: ${plugin} already added
		fi
		try asdf install ${plugin} ${ver}
	fi
done
