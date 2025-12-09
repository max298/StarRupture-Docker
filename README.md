# StarRupture Dedicated Server - Docker Container

Docker Linux container image for running a StarRupture dedicated server.

## ⚠️ Disclaimer

This Docker container was created during the playtest phase of the game.  
Since the full game has not been released yet, the container is currently **not functional** and **cannot run** as intended.
Functionality will be updated once the final game becomes available.

## Usage

**Note**: These steps only apply if you want to experiment with the current non-functional pre-release container.

At the moment the image needs to be build by yourself.

```bash
git clone git@github.com:max298/StarRupture-Docker.git
cd StarRupture-Docker

sudo docker compose build

# because you need to login using steam, an interactive shell is required for the first run
# for now I cache the entire Steam directory, because we want to cache saved credentials
# and also game-data
mkdir ./data/Steam
sudo docker run -it -v ./data:/server/Steam <the-image-from-above>

# once you're logged in, you can CTRL+C und start the server using compose
sudo docker compose up -d
```
