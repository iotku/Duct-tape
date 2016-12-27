#!/bin/bash
# Control volume of "Music-Local" strip in non-mixer, for use on my i3blocks i3statusbar
arg="$1"
if [ "$arg" ==  "up" ]; then
    CUR_VOL=$(echo "$(cat ~/.config/iotku/vol/cur_vol) + 0.025" | bc)
else
    CUR_VOL=$(echo "$(cat ~/.config/iotku/vol/cur_vol) - 0.025" | bc)
fi
oscsend localhost 98012 "/strip/Music-Local/Gain/Gain%20(dB)" f "$CUR_VOL"

echo $CUR_VOL > ~/.config/iotku/vol/cur_vol
