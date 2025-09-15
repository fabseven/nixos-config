#!/run/current-system/sw/bin/bash

HYPRIDLE_BIN="/run/current-system/sw/bin/hypridle"
NOTIFY_SEND="/run/current-system/sw/bin/notify-send"
PGREP="/run/current-system/sw/bin/pgrep"
PKILL="/run/current-system/sw/bin/pkill"

if $PGREP -x hypridle >/dev/null; then
  $PKILL -x hypridle
  $NOTIFY_SEND "Stop locking computer when idle"
else
  $HYPRIDLE_BIN >/dev/null 2>&1 &
  $NOTIFY_SEND "Now locking computer when idle"
fi