#!/usr/bin/env bash

# load ASDF if available
if [ -f ~/.asdf/asdf.sh ] ; then
  . ~/.asdf/asdf.sh
fi
kubectl config current-context
