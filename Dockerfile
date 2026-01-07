FROM docker.io/steamcmd/steamcmd:cachyos-3

# create non-privileged user
WORKDIR /server
RUN groupadd --gid 1000 user
RUN useradd --uid 1000 --gid 1000 --home-dir /server --shell /bin/false user
RUN chown -R user: /server

# app-id of playtest server
ENV STEAMAPPID="3809400"
ENV HOME=/server

# requirements for running the server under linux
RUN pacman -S --noconfirm wine winetricks xorg-server-xvfb
RUN pacman -Scc --noconfirm
# update sha256 hashes for vcrun2022 installation
RUN winetricks --self-update

USER user
ENV HOME=/server

# the following trick is required because wine runs some tasks
# in the background and we need to wait until they are done
RUN bash -c ' \
  wineboot --init; \
  printf "Waiting for child processes...\n"; \
  while [ $(ps | grep "[w]ine" | wc -l) -gt 1 ]; do \
    printf "Still waiting for wineboot to finish ... \n"; \
    sleep 3; \
  done; \
  printf "wineboot finished.\n"'

# use xvfb-run because winetricks assumes display
# https://github.com/Winetricks/winetricks/issues/934
RUN bash -c ' \
  xvfb-run winetricks -q vcrun2022; \
  printf "Waiting for child processes...\n"; \
  while [ $(ps | grep "[w]ine" | wc -l) -gt 1 ]; do \
    printf "Still waiting for winetricks to finish ... \n"; \
    sleep 3; \
  done; \
  printf "winetricks finished.\n"'

COPY --chown=user:user entrypoint.sh /server/entrypoint.sh
RUN chmod +x /server/entrypoint.sh

# fixme: check which ports are required for the game to run
EXPOSE 7777/udp
EXPOSE 30010/tcp
EXPOSE 30020/tcp

ENTRYPOINT ["/server/entrypoint.sh"]
