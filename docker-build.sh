#!/bin/bash

## .dockerignore needs to be in the context ##
## sudo docker build --no-cache --force-rm -f /home/user1m/workspace/sketch2pix/Dockerfile -t user1m/sketchme .
## Sending build context to Docker daemon  283.9MB

cd ../;
sudo docker build --no-cache --force-rm -f ./sketch2pix/Dockerfile -t user1m/sketchme .
