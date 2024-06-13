#!/bin/bash
killall swww-daemon
swww-daemon &
sleep 1
swww img ~/Wallpaper.png --filter Nearest
