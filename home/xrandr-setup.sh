#!/bin/sh
xrandr \
  --output HDMI-0 --mode 2560x1440 --rate 59.95 --pos 0x0 --rotate normal \
  --output DP-0 --mode 2560x1440 --rate 144.00 --pos 2560x0 --primary --rotate normal

