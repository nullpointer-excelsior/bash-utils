#!/bin/bash

_reverse_search() {
  local selected_command=$(fc -rl 1 | awk '{$1="";print substr($0,2)}' | sort -u | fzf )
  LBUFFER=$selected_command
}

zle -N _reverse_search
bindkey '^r' _reverse_search
