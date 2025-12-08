# StarRupture Dedicated Server - Docker Container

Docker Linux container image for running a StarRupture dedicated server.

**NOTE The game is _not released_. I've created this container during the playtest from 12-04 - 12-08. I assume when the game releases this container should work with some slight modifications, so it should be a good starting point.**

## Usage

At the moment the image needs to be build by yourself.

```bash
sudo docker build . -t max/SR-server
sudo docker run -e user="YOUR_STEAM_USERNAME" --netmode=host -it max/SR-server
```
