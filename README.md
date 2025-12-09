# StarRupture Dedicated Server - Docker Container

Docker Linux container image for running a StarRupture dedicated server.

## ⚠️ Disclaimer

This Docker container was created during the playtest phase of the game. Unfortunately the playtest ended before I could test everything.
Since the game is not released at all, the container is currently **not functional** and **cannot run** at all.
When the full game releases I hope to get this running asap, however I did notice quite a lot of error-logs from wine and I'm not that
familiar with running windows programs in linux.

## Usage

**Note**: These steps only apply if you want to experiment with the current non-functional pre-release container.
Since the playtest finished you'll be unable to download the server from steam.

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

# once you're logged in, you can CTRL+C and start the server using compose
sudo docker compose up -d
```
