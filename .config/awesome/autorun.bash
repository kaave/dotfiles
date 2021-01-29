#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run dropbox start -i
run /opt/Enpass/bin/runenpass.sh startWithTray
#run fcitx
