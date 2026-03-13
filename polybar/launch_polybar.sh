#!/bin/bash

# Kill any existing Polybar instances
killall -q polybar

# Wait until they are gone
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# Launch Polybar on all connected monitors
if type "xrandr" >/dev/null 2>&1; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar toph &
  done
else
  polybar toph &
fi

