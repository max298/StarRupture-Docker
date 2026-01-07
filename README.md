# StarRupture Dedicated Server - Docker Container

Very minimal Docker Linux container image for running a StarRupture dedicated server.

## Usage

```bash
sudo docker run -p "7777:7777/udp" -p "7777:7777/tcp" -v ./data:/server/gamedata ghcr.io/max298/starrupture-docker:main
```

You can now start the game. In order to use your newly created server:

1. Click `Manage Server` and enter your **public IP** (`curl ifconfig.me`). ⚠️ Using a private IP does not seem to work! ⚠️
    1. Provide a server password. This is your management password.
    1. (Optional): Click `Change password`. This will set a Game-Password which will be required for others to join your server. Skipping this will allow anyone to join.
    1. Click `New Game` and give the session a custom name.
    1. Click `Start Game`
    1. Wait (took about 10 seconds for me)
    1. You should see a message confirming the session: `Session running` - Press OK
1. Back at the main menu, now select `Join Game` and click `Dedicated Server` in the buttom left corner.
    1. Now enter your public IP and provide the password you've entered earlier

You should now load into a new game running your very own dedicated server.

## Resuming the game

In case the server was stopped and should resume, you'll have to open the `Manage Server` screen again, then press the `Load Game` button and load your savegame.
