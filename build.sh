#!/bin/bash

podman build --build-arg USER=$USER --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t brave-container .
