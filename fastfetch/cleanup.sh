#!/bin/bash

echo "🔵 Cleaning Brave temporary files..."

# IndexedDB (most browser games store their data here)
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/IndexedDB/*

# Local Storage
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/Local\ Storage/*

# Service Worker CacheStorage
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/Service\ Worker/CacheStorage/*

# GPU / WebGL / WebGPU caches
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/GPUCache/*
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/ShaderCache/*

# Unity WebGL / BlobStorage (heavy games)
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/BlobStorage/*

# AppImage cache (if you use AppImages in general)
rm -rf ~/.cache/appimagekit
rm -rf ~/.cache/thumbnails/*

# System cache (safe)
sudo rm -rf /var/cache/*

# Thumbnails cleanup
rm -rf ~/.cache/thumbnails/*

echo "✅ Cleaning complete!"


#!/bin/bash

echo "🔵 Cleaning Firefox cache..."

PROFILE_DIR=$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default*" | head -n 1)

if [ -z "$PROFILE_DIR" ]; then
    echo "⚠️ Firefox profile not found!"
    exit 1
fi

echo "Using profile: $PROFILE_DIR"

# Cache
rm -rf "$PROFILE_DIR"/cache2/*

# Startup Cache
rm -rf "$PROFILE_DIR"/startupCache/*

# GPU / WebGL cache
rm -rf "$PROFILE_DIR"/shader-cache/*

# OBS Studio cache and browser data
rm -rf ~/.cache/obs-studio/*
rm -rf ~/.config/obs-studio/plugin_config/*
rm -rf ~/.config/obs-studio/plugin_data/obs-browser/cache/*
rm -rf ~/.config/obs-studio/plugin_data/obs-browser/Code\ Cache/*
rm -rf ~/.config/obs-studio/logs/*

# Pacman temporary files
sudo rm -rf /var/tmp/pacman*
sudo pacman -Scc
sudo pacman -Sc

# System journal cleanup
sudo journalctl --vacuum-size=500M   # Keep up to 500 MB
sudo journalctl --vacuum-time=7d     # Keep only the last 7 days
sudo rm -rf /var/cache/*
rm -rf ~/.cache/*
sudo journalctl --vacuum-size=100M

# Service Worker cache
rm -rf "$PROFILE_DIR"/storage/default/*/cache/*

# IndexedDB (stores heavy browser game files)
rm -rf "$PROFILE_DIR"/storage/default/*/idb/*

# Local storage temporary data (does not touch history)
rm -rf "$PROFILE_DIR"/storage/default/*/ls/*

# Thumbnails
rm -rf ~/.cache/mozilla/firefox/*

echo "✅ Firefox cache cleaned successfully!"

# VS Code cache
rm -rf ~/.config/Code/Cache/*
rm -rf ~/.config/Code/CachedData/*
rm -rf ~/.config/Code/GPUCache/*
rm -rf ~/.config/Code/User/workspaceStorage/*
rm -rf ~/.config/Code/crashpad/*
