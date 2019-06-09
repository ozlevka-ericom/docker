#!/bin/bash -e
docker run --rm -it \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --net=host \
    -v /home/ozlevka/second/config/.IdeaIC2019.1:/root/.IdeaIC2019.1 \
    ozlevka/groovy /idea-IC-191.6707.61/bin/idea.sh