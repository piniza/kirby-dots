#!/bin/sh

ps aux| grep "polybar tray"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
ps aux| grep "polybar ressources"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
ps aux| grep "polybar close"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
polybar open &