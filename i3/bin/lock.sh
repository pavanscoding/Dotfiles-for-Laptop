#!/usr/bin/env bash
##!/bin/bash
#https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/
sleep .2
scrot /tmp/screen.png
convert /tmp/screen.png -blur 0x5 /tmp/screen.png
# convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert ~/.config/i3/bin/lock.png -resize 400x200 ~/.config/i3/bin/lock.png
composite -gravity center ~/.config/i3/bin/lock.png /tmp/screen.png /tmp/screen.png 
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
