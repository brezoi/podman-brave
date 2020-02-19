FROM fedora:latest

ARG USER=brave
ARG UID=1000
ARG GID=1000

RUN useradd -m ${USER} --uid=${UID} \
	&& dnf -y install dnf-plugins-core pulseaudio \
	&& dnf config-manager --add-repo https://brave-browser-rpm-nightly.s3.brave.com/x86_64/ \
	&& rpm --import https://brave-browser-rpm-nightly.s3.brave.com/brave-core-nightly.asc \
	&& dnf -y install brave-browser-nightly \
	&& dnf -y update

USER ${UID}:${GID}
WORKDIR /home/${USER}

ENTRYPOINT ["/usr/bin/brave-browser"]
CMD ["about:blank"]
