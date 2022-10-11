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
	# github.com/starkers/ggg@latest
	golang.org/x/tools/cmd/goimports@latest
	#github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.0
)

for data in ${globalPlugins[@]}; do
	say installing $data
	try go install -x ${data}
done
