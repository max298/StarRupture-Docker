#!/usr/bin/env bash

printf "Updating game %s...\n" "$STEAMAPPID"
steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir /server/gamedata +login anonymous +app_update "$STEAMAPPID" validate +quit

printf "Starting server...\n"
xvfb-run wine /server/gamedata/StarRupture/Binaries/Win64/StarRuptureServerEOS-Win64-Shipping.exe -Log -port=7777 2>&1
