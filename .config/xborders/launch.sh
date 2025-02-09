#!/bin/bash

# Run xborders with nohup to ensure it runs after the terminal is closed
nohup ~/.config/xborders/xborders --config ~/.config/xborders/example_config.json > /dev/null 2>&1 &
