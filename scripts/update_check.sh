#!/usr/bin/zsh

export XDG_RUNTIME_DIR=/run/user/$(id -u)
updates=$(checkupdates | grep 'linux ')
if [ ! -z "$updates" ]; then
  ver=$(echo $updates | grep -o " .*" | cut -c2-)
  if [ -f "/home/jason/scripts/$ver.tmpupd" ]; then exit 1; fi
  notify-send "linux upgraded at $(date)" "$ver"
  rm -rf /home/jason/scripts/*.tmpupd
  touch "/home/jason/scripts/$ver.tmpupd"
fi;
updateslts=$(checkupdates | grep linux-lts)
if [ ! -z "$updateslts" ]; then
  ver=$(echo $updateslts | grep -o " .*" | cut -c2-)
  if [ -f "/home/jason/scripts/$ver.tmpupdlts" ]; then exit 1; fi
  notify-send "linux-lts upgraded at $(date)" "$ver"
  rm -rf /home/jason/scripts/*.tmpupdlts
  touch "/home/jason/scripts/$ver.tmpupdlts"
fi;
