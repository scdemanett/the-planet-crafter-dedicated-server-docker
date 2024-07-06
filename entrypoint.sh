#!/bin/bash

# Navigate to the game directory
cd /home/planetcrafter

# Install Proton
mkdir -p $HOME/.steam/root/compatibilitytools.d
wget -O /tmp/proton.tar.gz https://github.com/GloriousEggroll/proton-ge-custom/releases/download/6.20-GE-1/Proton-6.20-GE-1.tar.gz
tar -xzf /tmp/proton.tar.gz -C $HOME/.steam/root/compatibilitytools.d
rm /tmp/proton.tar.gz

# Set up Proton
export STEAM_COMPAT_DATA_PATH=/home/planetcrafter/steam_compat
export STEAM_COMPAT_CLIENT_INSTALL_PATH=/home/planetcrafter/.steam/root
mkdir -p $STEAM_COMPAT_DATA_PATH

# Run the game using Proton
$HOME/.steam/root/compatibilitytools.d/Proton-6.20-GE-1/proton run /home/planetcrafter/Planet\ Crafter.exe -batchmode -nographics
