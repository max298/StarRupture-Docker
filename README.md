# StarRupture Dedicated Server - Docker Container

Very minimal Docker Linux container image for running a StarRupture dedicated server.

## ⚠️ Disclaimer

This container does not work at the moment. It creates the server, but you can not start the game.

## Usage

**Note**: These steps only apply if you want to experiment with the current non-functional container.

At the moment the image needs to be build by yourself.

```bash
git clone git@github.com:max298/StarRupture-Docker.git
cd StarRupture-Docker
sudo docker compose up -d
```

### Environment

I couldn't find any parameters to configure the server itself, so there are only two environment variables:
- `STEAMAPPID` (default 4225260) - the app-id of the server from steam. Will be used to download the game data
