#!/bin/bash
TMP_FILE="/tmp/screenshot_$(date +%s).png"
hyprshot -m region -o "$TMP_FILE"
wl-copy < "$TMP_FILE"
rm "$TMP_FILE"
