# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
polybar main &

# Launch external monitor if connected
if [[ $(xrandr -q | grep 'DP-1-1 connected') ]]; then
    polybar external &
fi
