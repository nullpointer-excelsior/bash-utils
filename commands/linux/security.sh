#!/bin/bash

# scan directory
docker run -it --rm \
    --mount type=bind,source=$HOME/Downloads/to-scan,target=/scandir \
    clamav/clamav:unstable \
    clamscan /scandir