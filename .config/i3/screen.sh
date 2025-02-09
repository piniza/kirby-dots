#!/bin/sh

if xrandr | grep -q "^DP1 connected"; then
    xrandr --output eDP1 --off --output DP1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
else
    exit 0
fi
