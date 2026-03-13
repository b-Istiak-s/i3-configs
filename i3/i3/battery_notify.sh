#!/bin/zsh

# Set low battery threshold
THRESHOLD=20
MAX=99
# Path to battery info (usually BAT0)
BATTERY_PATH="/sys/class/power_supply/BAT0"
STATUS=$(cat "$BATTERY_PATH/status")

# Read current capacity
if [[ -f "$BATTERY_PATH/capacity" ]]; then
  BATTERY=$(cat "$BATTERY_PATH/capacity")
else
  echo "Battery info not found"
  exit 1
fi

# Notify if below threshold
if ((BATTERY <= THRESHOLD)) && [[ "$STATUS" == "Discharging" ]]; then
  notify-send "Battery Low" "Battery is at ${BATTERY}%!" -u critical
fi

if ((BATTERY >= MAX)) && [[ "$STATUS" == "Charging" ]]; then
  notify-send "Battery Almost Full" "Battery is at ${BATTERY}%! You can unplug the charger." -u normal -t 6000
fi
