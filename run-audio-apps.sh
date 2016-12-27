#!/bin/bash
# Terrible way I start jack/non-mixer/mpd on boot
if pgrep "qjackctl" > /dev/null
then
    echo "Not starting, qjackctl already running."
else
    exec start-pulseaudio-x11 &
    exec qjackctl &
    exec non-mixer --osc-port 98012 /home/ku/Non-mixer/stream &
    echo "0.921" > ~/.config/iotku/vol/cur_vol
    exec mpd &
fi


