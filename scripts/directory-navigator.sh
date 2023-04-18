#!/bin/bash

omit_dirs="./venv|./node_modules"

directory=$(find . -type d -maxdepth 3 | grep -vE "$omit_dirs" | fzf --preview '/opt/homebrew/bin/lsd --color=always  -la {}')

if [ -n "$directory" ]; then
  eval "cd $directory"
fi

