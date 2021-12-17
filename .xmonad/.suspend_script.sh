#!/bin/bash
sudo -u vatrat sh -c "{ export DISPLAY=':0'; /home/vatrat/.xmonad/.xmonad_lock.sh; }" &
sleep 10 && \
systemctl suspend
