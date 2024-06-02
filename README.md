# ARK Server Docker Image

A Docker image for an ARK: Survival Evolved server using the vanilla SteamCMD, without additional managing tools.

## Building the Image

Clone the repository:

```sh
git clone https://github.com/gordon0907/ark-server.git
cd ark-server
```

Build the Docker image:

```sh
sudo docker build --tag ark-server:latest .
```

## Exporting the Image

Save the Docker image to a file:

```sh
sudo docker save --output ark-server.tar ark-server:latest
```

## Container Configuration for DSM

- **Container Name**: SteamCMD
- **CPU Priority**: High
- **Memory Limit**: 4096 MB
- **Volume**: `/docker/SteamCMD:/home/steam/SteamCMD`
- **Environment**:
  - `UID: <DSM user ID>`
  - `GID: <DSM group ID>`
- **Network**: Host
