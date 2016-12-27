#!/bin/bash
# Block for i3blocks to control certain strip in non-mixer
filter() {
    cat ~/.config/iotku/vol/cur_vol
}

case $BLOCK_BUTTON in
    4) bash /home/ku/bin/music-osc-vol.sh up && cat  ~/.config/iotku/vol/cur_vol  | filter ;;  # scroll up, previous
    5) bash /home/ku/bin/music-osc-vol.sh down && cat  ~/.config/iotku/vol/cur_vol | filter ;;  # scroll down, next
    *) echo huh | filter ;;
esac
