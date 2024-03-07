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
	## misc helpers
	github.com/starkers/ggg@latest
	github.com/starkers/starship-cfg@latest
	github.com/hidetatz/kubecolor/cmd/kubecolor@latest


	##### go dev tooling
	# bou.ke/babelfish@latest # https://github.com/bouk/babelfish
	github.com/a-h/templ/cmd/templ@latest
	github.com/cosmtrek/air@latest
	github.com/incu6us/goimports-reviser/v3@latest
	github.com/rakyll/gotest@latest
	github.com/segmentio/golines@latest
	github.com/spf13/cobra-cli@latest
	github.com/wailsapp/wails/v2/cmd/wails@latest
	golang.org/x/tools/cmd/goimports@latest
	mvdan.cc/gofumpt@latest

)

for data in "${globalPlugins[@]}"; do
	say installing "${data}"
	try go install -x "${data}"
done

try asdf reshim golang
