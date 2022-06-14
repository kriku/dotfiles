#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

# echo "Polybar launched..."

# if type "xrandr"; then
#     # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     #     MONITOR=$m polybar --reload example &
#     # done
#     for m in $(polybar --list-monitors | cut -d":" -f1); do
#         MONITOR=$m polybar --reload example &
#     done
# else
#     polybar --reload example &
# fi

# if type "xrandr">/dev/null; then
#     echo "Lanching polybar for each screen"
#     xrandr --listactivemonitors | grep -oP '(HDMI\-\d+$|eDP\-\d+$)' | xargs -P1 -I{} bash -c "MONITOR={} polybar -q -r p00 &"
# fi
