
set INC_FILE $HOME/.google-cloud-sdk/path.fish.inc

if test -f $INC_FILE
    . $INC_FILE
end

# https://git.polarian.dev/AUR/google-cloud-cli/pulls/10#issuecomment-291
if test -d /opt/google-cloud-cli
    set CLOUDSDK_ROOT_DIR /opt/google-cloud-cli
    set GOOGLE_CLOUD_SDK_HOME $CLOUDSDK_ROOT_DIR
    set CLOUDSDK_PYTHON /usr/bin/python
    set CLOUDSDK_PYTHON_ARGS -S
    fish_add_path $CLOUDSDK_ROOT_DIR/bin
end
