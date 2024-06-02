#!/bin/bash

# Update the `steam` user with the specified UID and GID
usermod --uid $UID steam
usermod --gid $GID steam

# Copy the start script to the volume if it doesn't already exist
if [[ ! -f /home/steam/Steam/start.sh ]]; then
    cp /home/steam/start.sh /home/steam/Steam/
    chown steam:steam /home/steam/Steam/start.sh
fi

# Switch to the `steam` user and execute the start script in the background
su --login steam -c "exec bash /home/steam/Steam/start.sh" &

# Capture the PID of the background child process
child_pid=$!

# Set a trap to gracefully terminate the child process upon receiving a SIGTERM signal
trap "kill $child_pid; wait $child_pid; exit 0" SIGTERM

# Block and wait for the child process
wait $child_pid
