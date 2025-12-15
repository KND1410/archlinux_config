#!/bin/bash
N=$1

# Lấy workspace ID hiện tại
CURRENT_WS=$(hyprctl activeworkspace -j | jq -r '.id')

# Lấy địa chỉ của window thứ N trong workspace hiện tại
WINDOW_ADDR=$(hyprctl clients -j | jq -r "[.[] | select(.workspace.id == $CURRENT_WS)] | sort_by(.at[0]) | .[$N].address // empty")

if [ -n "$WINDOW_ADDR" ]; then
    hyprctl dispatch focuswindow "address:$WINDOW_ADDR"
else
    echo "No window at index $N"
fi
