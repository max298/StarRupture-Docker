#!/usr/bin/env bash

printf "Updating game %s...\n" "$STEAMAPPID"
steamcmd +login "$username" +app_update "$STEAMAPPID" validate +quit +force_install_dir /server

printf "Starting server...\n"
xvfb-run wine "/server/Steam/steamapps/common/StarRupture Playtest Dedicated Server/StarRuptureServerEOS.exe" -Log -port=7777
