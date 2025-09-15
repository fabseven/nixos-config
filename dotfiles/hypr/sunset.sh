#!/run/current-system/sw/bin/bash

# Default temperature values
ON_TEMP=4000
OFF_TEMP=6000
HYPRCTL="/run/current-system/sw/bin/hyprctl"
PGREP="/run/current-system/sw/bin/pgrep"
NOTIFY_SEND="/run/current-system/sw/bin/notify-send"

# Ensure hyprsunset is running
if ! $PGREP -x hyprsunset; then
  setsid uwsm app -- hyprsunset &
  sleep 1 # Give it time to register
fi

# Query the current temperature
CURRENT_TEMP=$($HYPRCTL hyprsunset temperature 2>/dev/null | grep -oE '[0-9]+')

if [[ "$CURRENT_TEMP" == "$OFF_TEMP" ]]; then
  $HYPRCTL hyprsunset temperature $ON_TEMP
  notify-send "  Nightlight screen temperature"
else
  $HYPRCTL hyprsunset temperature $OFF_TEMP
  notify-send "   Daylight screen temperature"
fi