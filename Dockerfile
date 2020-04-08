########################################################
############## We use a java base image ################
########################################################
FROM ubuntu:latest

MAINTAINER Stephen Farnsworth <ilektron@ilektronx.com>

ARG bedrock_zip_url=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.32.1.zip
ENV BEDROCK_ZIP_URL=$bedrock_zip_url

WORKDIR /opt/minecraft

# Install dependencies
RUN apt-get update && apt-get install -y \
  unzip \
  libcurl4

# Download paperclip
ADD ${BEDROCK_ZIP_URL} bedrock_server.zip
ADD bedrock_server.sh /bin/bedrock_server.sh

# User
RUN useradd -ms /bin/bash minecraft && \
    chown minecraft /opt/minecraft -R

USER minecraft

# Working directory
WORKDIR /data

# Obtain server config
ADD server.properties /opt/minecraft/server.properties

# Volumes for the external data (Server, World, Config...)
VOLUME "/data"

# Expose minecraft port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Entrypoint with java optimisations
ENTRYPOINT ["/bin/bedrock_server.sh"]
