#!/bin/bash

# Check if Polybar is running
if pgrep -x "polybar" > /dev/null; then
    # Kill all running Polybar instances
    killall -q polybar
else
    # Relaunch Polybar
    ~/.config/polybar/launch.sh
fi
