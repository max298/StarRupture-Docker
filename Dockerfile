FROM docker.io/steamcmd/steamcmd:cachyos-3

COPY entrypoint.sh /server/entrypoint.sh
RUN chmod +x /server/entrypoint.sh

# create non-privileged user
RUN groupadd --gid 1000 user
RUN useradd --uid 1000 --gid 1000 --home-dir /server --shell /bin/false user
RUN chown -R user: /server
WORKDIR /server

# app-id of playtest server
ENV app_id="4225260"
ENV HOME=/server

# requirements for running the server under linux
RUN pacman -S --noconfirm wine winetricks xorg-server-xvfb
# update sha256 run for vcrun2022 installation
RUN winetricks --self-update

USER user
ENV HOME=/server
# FIXME: Add mechanism in order to wait for wineboot --init to finish, otherwise winetricks won't work
RUN wineboot --init
# because winetricks assumes display, see https://github.com/Winetricks/winetricks/issues/934
#RUN xvfb-run winetricks -q vcrun2022

# fixme: check which ports are required for the game to run
EXPOSE 7777/udp
EXPOSE 7778/udp
EXPOSE 27015/udp
EXPOSE 27020/tcp

ENTRYPOINT ["/server/entrypoint.sh"]
