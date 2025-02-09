#!/bin/bash

# Terminate already running bar instances
killall polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar main 2>&1 | tee -a /tmp/polybar.log & disown
polybar first 2>&1 | tee -a /tmp/polybar.log & disown
polybar open 2>&1 | tee -a /tmp/polybar.log & disown
polybar center 2>&1 | tee -a /tmp/polybar.log & disown
polybar right 2>&1 | tee -a /tmp/polybar.log & disown
polybar power 2>&1 | tee -a /tmp/polybar.log & disown
polybar utils 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."