#!/usr/bin/env bash

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

source "${ROOTDIR}/shell-functions"
declare -a deps=(
	go
	git
)

for dep in "${deps[@]}"; do
	if ! executableInPath "${dep}"; then
		die "please install '${dep}' to continue"
	fi
done

#############################################################

declare -a globalPlugins=(
	# bou.ke/babelfish@latest # https://github.com/bouk/babelfish
	github.com/hidetatz/kubecolor/cmd/kubecolor@latest
	github.com/rakyll/gotest@latest
	github.com/spf13/cobra-cli@latest
	github.com/starkers/ggg@latest
	github.com/starkers/starship-cfg@latest
	github.com/xxxserxxx/gotop/v4/cmd/gotop@latest
	golang.org/x/tools/cmd/goimports@latest
)

for data in "${globalPlugins[@]}"; do
	say installing "${data}"
	try go install -x "${data}"
done
