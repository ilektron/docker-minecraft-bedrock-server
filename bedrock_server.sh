#!/bin/bash
FILE=/data/server/bedrock_server
if [ -f "$FILE" ]; then
    echo "$FILE exists"
else
    echo "$FILE does not exist"
    unzip /opt/minecraft/bedrock_server.zip -d /data/server
fi

cd /data/server
LD_LIBRARY_PATH=. ./bedrock_server
