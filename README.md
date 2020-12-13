Steam games in Docker
=====================

This Dockerfile allows you to run Steam and play games in a container running in a standard Gnome desktop session.

Build
-----
`$ docker build . -t docker-steam`

Use
---

Create once with:

```
$ docker create \
    --name steam \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -e DISPLAY=$DISPLAY \
    --device /dev/dri \
    -v /var/run/dbus/:/var/run/dbus/ \
    -v /share:/share \
    --net=host --ipc=host --privileged \
    docker-steam
```

Then run it each time with:

```
$ docker start steam
```
