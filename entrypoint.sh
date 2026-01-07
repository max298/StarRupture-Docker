#!/usr/bin/env bash

# check existance of steamcmd.exe
if [ ! -e "./steamcmd/steamcmd.exe" ]; then
  # get steamcmd.exe (because linux-steamcmd won't download windows-app)
  printf "Downloading steamcmd...\n"
  curl --output "steamcmd.zip" https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
  unzip steamcmd.zip
  # cleanup
  rm steamcmd.zip
  # move to persistant storage
  mv steamcmd.exe /server/steamapps
fi

printf "Updating game %s...\n" "$STEAMAPPID"
wine /server/steamapps/steamcmd.exe +force_install_dir /server +login anonymous +app_update "$STEAMAPPID" validate +quit

printf "Starting server...\n"
xvfb-run wine "/server/steamapps/common/StarRupture Dedicated Server/StarRuptureServerEOS.exe" -Log -port=7777
