#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Change to the user's home directory
cd "$HOME"

# Update ARK: Survival Evolved Dedicated Server using SteamCMD
./steamcmd/steamcmd.sh +login anonymous +app_update 376030 +quit

# Replace the current shell with the ARK server process
exec "./Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Binaries/Linux/ShooterGameServer" Extinction?listen?SessionName=gordon0907?ServerPassword=123?ServerAdminPassword=2002?Port=7777?QueryPort=27015?MaxPlayers=8 -culture=en -NoBattlEye
