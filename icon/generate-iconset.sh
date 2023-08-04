#!/bin/bash
set -eu

declare -a arr=(16 32 64 128 256 512 1024 2048)
arrayLength=$(( ${#arr[@]}-1 ))

for (( i=0; i<${arrayLength}; i++))
do
  sips -z ${arr[$i]} ${arr[$i]} ./icon.png --out ./icons.iconset/icon_${arr[$i]}x${arr[$i]}.png
  sips -z ${arr[$i+1]} ${arr[$i+1]} ./icon.png --out ./icons.iconset/icon_${arr[$i]}x${arr[$i]}@2x.png
done

iconutil -c icns -o icons.icns icons.iconset
cp icons.icns ../YourApp.app/Contents/Resources/icons.icns