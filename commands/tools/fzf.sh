#!/bin/bash

# select containerId from docker ps
docker ps | fzf | awk '{print $1}'

# list current directory and enter on selected directory
cd "$(ls | fzf)"
