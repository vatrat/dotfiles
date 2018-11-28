#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -filter point -resize 20% -resize 500% /tmp/screen.png
i3lock -e -i /tmp/screen.png
