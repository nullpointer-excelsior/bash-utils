#!/bin/bash

# cambiar de teclado
setxkbmap es

# cuanto tiempo esta el sistema arriba
uptime

# ver info de usuario unix
finger username

# ver nombre distribucion
cat /etc/*-release
lsb_release -a
hostnamectl

# show prompt colors
# for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done