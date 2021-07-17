#!/bin/bash

. ~/scripts/lastVars.sh
songInfo=$(python3 ~/scripts/last.py)
RESULT=$?
if [ $RESULT -eq 0 ]; then
    echo $songInfo > ~/scripts/tmplfm
else
    songInfo=$(cat ~/scripts/tmplfm)
fi
songName=$(echo $songInfo | jq -r ".song_name")
songArtist=$(echo $songInfo | jq -r ".artist_name")
songAlbum=$(echo $songInfo | jq -r ".album_name")

echo "#img path=$HOME/scripts/album.png width=200 height=200 align=center"
echo $songName 
echo $songArtist 
echo $songAlbum
