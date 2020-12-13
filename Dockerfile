FROM ubuntu:20.04

ENV USER gamer
ENV UID 1000
ENV GID 1000
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y --install-recommends \
	sudo software-properties-common curl xterm wget pciutils libnss3 zenity \
	libgl1-mesa-dri:i386 libgl1:i386 libc6:i386 
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN groupadd --gid $GID $USER
RUN useradd -rm -d /home/$USER -s /bin/bash -g $USER -G sudo -u $UID $USER
RUN curl -L 'https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb' > /tmp/steam.deb
RUN dpkg -i /tmp/steam.deb
USER $USER

CMD steam
