#!/bin/sh

# Check if Bluetooth is powered on
powered=$(bluetoothctl show 2>/dev/null | grep "Powered:" | awk '{print $2}')

if [ "$powered" != "yes" ]; then
  echo " off" # Bluetooth is off
else
  # Check if a device is connected
  info=$(bluetoothctl info 2>/dev/null)
  if echo "$info" | grep -q "Connected: yes"; then
    name=$(echo "$info" | grep "Name:" | cut -d ':' -f2 | sed 's/^ //')
    echo " $name"
  else
    echo " on" # Bluetooth is on but no device connected
  fi
fi
