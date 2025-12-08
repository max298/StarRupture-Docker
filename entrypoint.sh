#!/usr/bin/env bash

# fixme: add to dockerfile, should not be part of this file
printf "Ensure vcrun2022 is installed...\n"
winetricks -q vcrun2022

# fixme: add new app-id for release
printf "Updating game %s...\n" "$app_id"
steamcmd +login "$username" +app_update "$app_id" validate +quit +force_install_dir /server
