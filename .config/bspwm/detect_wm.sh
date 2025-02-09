#!/bin/bash

wm_check=$(xprop -root _NET_SUPPORTING_WM_CHECK | awk -F' = ' '{print $2}' | tr -d ' ')

if [ -n "$wm_check" ] && xprop -id "$wm_check" | grep -q i3; then
  echo "true" > ~/.config/bspwm/wm-ignore
else
  echo "false" > ~/.config/bspwm/wm-ignore
fi
