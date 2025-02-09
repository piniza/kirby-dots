#!/bin/bash

BAR_COLLAPSED="collapsed"
BAR_EXPANDED="expanded"

case "$1" in
  show-expanded)
    polybar-msg action "#${BAR_COLLAPSED}.cmd" hide
    polybar-msg action "#${BAR_EXPANDED}.cmd" show
    ;;
  show-collapsed)
    polybar-msg action "#${BAR_EXPANDED}.cmd" hide
    polybar-msg action "#${BAR_COLLAPSED}.cmd" show
    ;;
  *)
    echo "Usage: $0 {show-expanded|show-collapsed}"
    ;;
esac
