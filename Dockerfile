# Base docker image
FROM ubuntu:wily
MAINTAINER Markus Kohler <markus.kohler@gmail.com>

ENV http_proxy http://proxy.wdf.sap.corp:8080
ENV https_proxy http://proxy.wdf.sap.corp:8080

# Install Darktable
RUN mkdir -p /usr/share/icons/hicolor && \
	apt-get update && apt-get install -y \
	ca-certificates \
	gconf-service \
	hicolor-icon-theme \
	libappindicator1 \
	libasound2 \
	libcanberra-gtk-module \
	libcurl3 \
	libexif-dev \
	libgconf-2-4 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libnspr4 \
	libnss3 \
	libpango1.0-0 \
	libv4l-0 \
	libxss1 \
	libxtst6 \
	wget \
	xdg-utils \
        software-properties-common \
        dbus-x11 \
			 gnome-keyring\
	 packagekit-gtk3-module \
        evolution \
        evolution-ews\
	--no-install-recommends && \
	 rm -rf /var/lib/apt/lists/*
#COPY local.conf /etc/fonts/local.conf

# Autorun Evolution, requires privileged mode
CMD [ "/usr/bin/evolution" ]
