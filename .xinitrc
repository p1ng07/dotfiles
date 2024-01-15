#!/bin/sh

nitrogen --restore &
pipewire &
pipewire-pulse &
wireplumber &
picom &
xmodmap ~/.Xmodmap
exec i3


exec xset b off

exec xbacklight -set 100
