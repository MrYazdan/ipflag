#! /bin/bash

widget_dir="/home/$(whoami)/.local/share/plasma/plasmoids/"
icon_dir="/home/$(whoami)/.local/share/icons/"

mv -f ipflag.svg $icon_dir
mv -f com.github.mryazdan.ipflag/ $widget_dir

echo "Completed!"
