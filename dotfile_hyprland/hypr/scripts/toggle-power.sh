#!/bin/bash

# Lấy profile hiện tại
current_profile=$(powerprofilesctl get)

# Tạo menu với rofi
selected=$(echo -e "performance\nbalanced\npower-saver" | rofi -dmenu -p "Power Profile (current: $current_profile)" -theme-str 'window {width: 450px;}')

# Kiểm tra nếu user chọn gì đó
if [ -n "$selected" ]; then
    powerprofilesctl set "$selected"
    
    # Thông báo dựa trên profile được chọn
    case "$selected" in
	    "performance")
	        notify-send "Power Profile" "Performance mode" -i power-profile-performance-symbolic
	        ;;
        "balanced")
            notify-send "Power Profile" "Balanced mode" -i power-profile-balanced-symbolic
            ;;
        "power-saver")
            notify-send "Power Profile" "Power Saver mode" -i power-profile-power-saver-symbolic
            ;;

    esac
fi
