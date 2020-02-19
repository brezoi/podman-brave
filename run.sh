#!/bin/bash

podman run --rm --security-opt label=disable -e XAUTHORITY -e XDG_RUNTIME_DIR -e WAYLAND_DISPLAY -e DISPLAY -e XDG_DATA_DIRS -e XDG_SESSION_TYPE -e XDG_SESSION_CLASS -e HOME -e USERNAME --volume "$XDG_RUNTIME_DIR":"$XDG_RUNTIME_DIR" --volume /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket --volume /tmp:/tmp  --userns=keep-id --user=$(whoami):$(whoami) --privileged --ipc host localhost/brave-container
