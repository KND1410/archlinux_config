#!/bin/bash
# Lock screen
hyprlock &

sleep 0.5

# 30s until sleep
(
    sleep 30
    if pidof hyprlock > /dev/null; then
        hyprctl dispatch dpms off
    fi
) &
