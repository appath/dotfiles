#!/usr/bin/env sh
# terminate already running bar instances
killall -q polybar
# wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done
# launch bar
polybar top &

echo "Polybar launched.."
