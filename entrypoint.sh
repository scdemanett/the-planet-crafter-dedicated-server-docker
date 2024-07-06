#!/bin/bash

# Setup Wine prefix and directories
export WINEPREFIX=/home/planetcrafter/.wine
export WINEARCH=win64

# Initialize the Wine prefix
wine64 wineboot

# Install necessary components using winetricks
winetricks -q corefonts vcrun2017

# Ensure the directory structure for the game saves
mkdir -p $WINEPREFIX/drive_c/users/planetcrafter/AppData/LocalLow/MijuGames/Planet\ Crafter

# Link the save directory
ln -s /home/planetcrafter/PlanetCrafter/saves $WINEPREFIX/drive_c/users/planetcrafter/AppData/LocalLow/MijuGames/Planet\ Crafter

# Navigate to the game directory
cd /home/planetcrafter/PlanetCrafter

# Run the game using Wine in headless mode with xvfb
xvfb-run -a wine64 "Planet Crafter.exe" -batchmode -nographics
