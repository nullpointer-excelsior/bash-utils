#!/bin/bash

# select containerId from docker ps
docker ps | fzf | awk '{print $1}'
