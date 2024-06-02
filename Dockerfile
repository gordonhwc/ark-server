FROM cm2network/steamcmd:latest

# Set environment variables
ENV UID=1000
ENV GID=1000
ENV TZ=Asia/Hong_Kong

# Switch to the root user
USER root

# Copy scripts to the container
COPY init.sh /home/steam/init.sh
COPY start.sh /home/steam/start.sh

# Define the volume
VOLUME ["/home/steam/Steam"]

# Set the entry point
ENTRYPOINT ["/home/steam/init.sh"]
