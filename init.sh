#!/bin/bash

# Update the `steam` user with the specified UID and GID
usermod --uid $UID steam
groupmod --gid $GID steam

# Copy the start script to the volume if it doesn't already exist
if [[ ! -f /home/steam/Steam/start.sh ]]; then
    cat /home/steam/start.sh > /home/steam/Steam/start.sh
fi

# Switch to the `steam` user and execute the start script
exec su --login steam -c "/home/steam/Steam/start.sh"
