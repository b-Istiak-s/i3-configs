#!/bin/zsh

# Set low battery threshold
THRESHOLD=20

# Path to battery info (usually BAT0)
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Read current capacity
if [[ -f "$BATTERY_PATH/capacity" ]]; then
  BATTERY=$(cat "$BATTERY_PATH/capacity")
else
  echo "Battery info not found"
  exit 1
fi

# Notify if below threshold
if ((BATTERY <= THRESHOLD)); then
  notify-send "Battery Low" "Battery is at ${BATTERY}%!" -u critical
fi
