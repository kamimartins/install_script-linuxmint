#!/bin/bash

repository="sharkdp/bat"
output_dir="$HOME/Downloads"

download_url=$(curl -sL "https://api.github.com/repos/$repository/releases/latest" | grep -oP '"browser_download_url": "\K([^"]+)' | grep "bat_.*_amd64.deb")

if [[ -n "$download_url" ]]; then
  wget -c "$download_url" -P "$output_dir"
else
  echo "Failed to retrieve download URL."
fi

