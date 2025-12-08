#!/usr/bin/env bash

# fixme: add hard code app-id after release
printf "Updating game %s...\n" "$app_id"
steamcmd +login "$username" +app_update "$app_id" validate +quit +force_install_dir /server

printf "Starting server...\n"
xvfb-run wine "/server/Steam/steamapps/common/StarRupture Playtest Dedicated Server/StarRuptureServerEOS.exe"
