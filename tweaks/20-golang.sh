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
	bou.ke/babelfish@latest # https://github.com/bouk/babelfish
	# github.com/starkers/ggg@latest
	golang.org/x/tools/cmd/goimports@latest
	#github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.0
	github.com/xxxserxxx/gotop/v4/cmd/gotop@latest
	github.com/spf13/cobra-cli@latest
)

for data in "${globalPlugins[@]}"; do
	say installing "${data}"
	try go install -x "${data}"
done
