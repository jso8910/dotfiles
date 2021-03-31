#!/usr/bin/zsh

export XDG_RUNTIME_DIR=/run/user/$(id -u)
updates=$(checkupdates | grep linux-lts)
if [ ! -z "$updates" ]; then
  ver=$(echo $updates | grep -o " .*" | cut -c2-)
  if [ -f "/home/jason/scripts/$ver.tmpupd" ]; then exit 1; fi
  notify-send "linux-lts upgraded at $(date)" "$ver"
  rm -rf /home/jason/scripts/*.tmpupd
  touch "/home/jason/scripts/$ver.tmpupd"
fi;
