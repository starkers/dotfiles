# vi: ft=fish

# set this Universal or it doesn't seem to always work ¯\_(ツ)_/¯
# This points at my local athens
# set -Ux GOPROXY http://localhost:3000
set -e GOPROXY #no more local go proxy
fish_add_path -a $GOPATH/bin
