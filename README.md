# StarRupture Dedicated Server - Docker Container

Very minimal Docker Linux container image for running a StarRupture dedicated server.

## Usage

**Note**: These steps only apply if you want to experiment with the current non-functional container.

At the moment the image needs to be build by yourself.

```bash
git clone git@github.com:max298/StarRupture-Docker.git
cd StarRupture-Docker
sudo docker compose up -d
```

You can now start the game. In order to use your newly created server:
1. Click `Manage Server` and enter your **public IP** (`curl ifconfig.me`). ⚠️ Using a private IP does not seem to work! ⚠️
    1. Provide a server password
    1. Click `New Game` and give the session a custom name.
    1. Click `Start Game`
    1. Wait (took about 10 seconds for me)
    1. You should see a message confirming the session: `Session running` - Press OK
1. Back at the main menu, now select `Join Game` and click `Dedicated Server` in the buttom left corner.
    1. Now enter your public IP and provide the password you've entered earlier

You should now load into a new game running your very own dedicated server.