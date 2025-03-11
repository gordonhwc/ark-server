# ARK Server Docker Image

A Docker image for an **ARK: Survival Evolved** server using the vanilla **SteamCMD**, without additional management
tools.

---

## Deployment

### Synology DSM

#### 1. Prebuild the Docker Image on Windows

Clone the repository:

```sh
git clone https://github.com/gordon0907/ark-server.git
cd ark-server
```

Build the image:

```sh
docker build --tag ark-server:latest .
```

Export the image:

```sh
docker save --output ark-server.tar ark-server:latest
```

#### 2. Import the Image into DSM Container Manager

#### 3. Configure the Container

| Setting                   | Value                                                     |
|---------------------------|-----------------------------------------------------------|
| **Container Name**        | `SteamCMD`                                                |
| **CPU Priority**          | High                                                      |
| **Memory Limit**          | 4096 MB                                                   |
| **Volume**                | `/docker/SteamCMD:/home/steam/Steam`                      |
| **Network**               | Host                                                      |
| **Environment Variables** |                                                           |
| `UID`                     | User ID of the owner of the mounting point (e.g., `1026`) |
| `GID`                     | Group ID of the owner of the mounting point (e.g., `100`) |

---

### macOS (ARM)

**Note:** SteamCMD Docker currently does not support **ARM**, but the ARK server can still run if downloaded from
another platform in advance.

#### 1. Download and Extract the Repository

```sh
git clone https://github.com/gordon0907/ark-server.git
cd ark-server
```

#### 2. Set Executable Permissions & Build the Image

```sh
chmod +x *
docker build --tag ark-server:latest .
```

#### 3. Run the Container

```sh
docker run --detach \
    --name SteamCMD \
    --env UID=501 \
    --env GID=20 \
    --env TZ=Asia/Hong_Kong \
    --publish 7777:7777/udp \
    --publish 7778:7778/udp \
    --publish 27015:27015/udp \
    --volume /Users/gordon/Downloads/SteamCMD:/home/steam/Steam \
    --volume "/Volumes/docker/SteamCMD/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved":"/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved" \
    --env CPU_MHZ=3200 \
    --memory 10g \
    ark-server:latest
```

- Adjust `UID` and `GID` according to your system.
- Adjust `CPU_MHZ` based on your machine's CPU speed.
- It is **recommended** to keep the entire server directory on a **local device** instead of a network drive to prevent
  slow loading times.
- However, the **save folder** (container path:
  `/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved`) can be mounted
  separately to a **network drive**.

#### 4. Modify `start.sh`

Comment out the **server update command** in `start.sh`, as **SteamCMD is not supported on ARM**.

---
