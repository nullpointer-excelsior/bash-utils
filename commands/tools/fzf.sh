#!/bin/bash

# select containerId from docker ps
docker ps | fzf | awk '{print $1}'

# list current directory and enter on selected directory
cd "$(ls | fzf)"

# navigate in the current folder. if de item selected is a file the cat command will be executed otherwise a change directory will be executed
declare p=$(ls | fzf);cd $p || cat $p

# show commit info
git log --oneline | fzf --preview 'git show --name-only {1}
