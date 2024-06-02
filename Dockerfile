FROM cm2network/steamcmd:latest

# Set environment variables
ENV UID=1000
ENV GID=1000
ENV TZ=Asia/Hong_Kong

# Switch to the root user
USER root

# Update the default user 'steam' with the specified UID and GID
RUN usermod --uid $UID steam && \
    groupmod --gid $GID steam

# Define the volume
VOLUME ["/home/steam/Steam"]

# Set the working directory
WORKDIR /home/steam/Steam

# Copy the start script to the volume
COPY --chown=steam:steam start.sh .

# Switch back to the default user 'steam'
USER steam

# Set the entry point to the start script
ENTRYPOINT ["./start.sh"]
