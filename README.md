# StarRupture Dedicated Server - Docker Container

Docker Linux container image for running a StarRupture dedicated server.

**NOTE The game is _not released_. I've created this container during the playtest from 12-04 - 12-08. I assume when the game releases this container should work with some slight modifications, so it should be a good starting point.**

## Usage

At the moment the image needs to be build by yourself.

```bash
sudo docker build . -t max/SR-server
# you must run the container using -it, beacuse you have to login using tty when you first launch the server
# for now, I've decided to mount the entire Steam direcotry, because we need to cache not only the game
# but also the credentials.
# in the future, I'll add a compose.yml and some instructions on the actual directories that we need as volumes
sudo docker run -it -v ./data:/server/Steam -e username="<your-steam-user>" --net=host max/SR-server
```
