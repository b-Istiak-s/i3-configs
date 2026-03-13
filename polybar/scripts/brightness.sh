#!/bin/sh

current=$(brightnessctl g) # current brightness
max=$(brightnessctl m)     # maximum brightness

# calculate percentage
percent=$((current * 100 / max))

echo "${percent}%"
