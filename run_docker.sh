docker run \
  -m=2g \
  --rm \
  --name mcserver \
  -v /Users/ilektron/Documents/mcserver:/data:rw \
  -p 25565:25565 \
  -p 25575:25575 \
-i ilektron/minecraft-bedrock-server:latest
docker attach mcserver
