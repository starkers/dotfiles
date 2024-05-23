#!/usr/bin/env bash
#
declare -a Apps=(
	# linux dev essentials
	atool
	fakeroot
	make
	pkgconf

	linux66
	linux66-headers

	# media
	pavucontrol
	cheese
	mpv
	nitrogen
	v4l2loopback-dkms
	flameshot

	# term essentials
	neovim
	fish
	bat
	ranger
	the_silver_searcher
	jq
	yq
	btop
	tig
	lazygit
	lsd

	tilix
	alacritty
	powertop
	drun

	docker
	docker-compose
	copyq

	# terminal misc
	# terminology ueberzug kitty
	xorg-xev
	arandr

	# js
	bun
	fnm-bin

	# py
	ipython
	python-pip
	python-poetry

	# cloud
	google-cloud-cli
	google-cloud-cli-gke-gcloud-auth-plugin

	# work
	visual-studio-code-bin
	icu69-bin

)

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

source "${ROOTDIR}/shell-functions"
declare -a deps=(
	yay
	pacman
)

for dep in "${deps[@]}"; do
	if ! executableInPath "${dep}"; then
		die "please install '${dep}' to continue"
	fi
done

function isAppInstalled() {
	RESULTS="$(yay -Q | cut -d " " -f 1)"
	if grep -q "${1}" <<<"${RESULTS}"; then
		return 1
	else
		return 0
	fi
}

yay -Sy
PacmanOpts="--color=always --noconfirm -y"

for data in "${Apps[@]}"; do
	if isAppInstalled "${data}"; then
		say yay -S ${PacmanOpts} "${data}"
		try yay -S ${PacmanOpts} "${data}"
	fi
done
