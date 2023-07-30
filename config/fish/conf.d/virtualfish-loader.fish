# https://github.com/justinmayer/virtualfish
# 
# using an asdf python:

# python -m pip install virtualfish
# asdf reshim python
# 'vf install'  (created this file)
# I've extended it to have some vars thats all

set ASDF_PY_PATH $HOME/.asdf/installs/python
set ASDF_PY_VER_FULL 3.8.8
set ASDF_PY_VER_MINOR 3.8


if test -d $ASDF_PY_PATH/$ASDF_PY_VER_FULL/bin
    set -g VIRTUALFISH_VERSION 2.5.4
    set -g VIRTUALFISH_PYTHON_EXEC $ASDF_PY_PATH/$ASDF_PY_VER_FULL/bin/python
    if test -f $ASDF_PY_PATH/$ASDF_PY_VER_FULL/lib/python$ASDF_PY_VER_MINOR/site-packages/virtualfish/virtual.fish
        source $ASDF_PY_PATH/$ASDF_PY_VER_FULL/lib/python$ASDF_PY_VER_MINOR/site-packages/virtualfish/virtual.fish
    end
    emit virtualfish_did_setup_plugins
end




# To create a new virtual environment use vf new
#
#  vf new my_new_env
#
# # If you want create a new python3 environment specify it via -p flag
#
#  vf new -p python3 my_new_env
#

# 
