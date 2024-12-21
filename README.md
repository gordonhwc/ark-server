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

## Running a Container

Create and run a new container from the image:

```sh
docker run --detach \
	--name SteamCMD \
	--env UID=1026 \
	--env GID=100 \
	--env TZ=Asia/Hong_Kong \
	--publish 7777:7777/udp \
	--publish 7778:7778/udp \
	--publish 27015:27015/udp \
	--volume /Volumes/docker/SteamCMD:/home/steam/Steam \
	ark-server:latest
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
- **Volume**: `/docker/SteamCMD:/home/steam/Steam`
- **Environment**:
  - `UID`: User ID of the owner of the mounting point
  - `GID`: Group ID of the owner of the mounting point
- **Network**: Host
