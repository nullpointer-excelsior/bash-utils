#!/bin/bash

#html='<a href="https://ibb.co/Bz8YFPQ"><img src="https://i.ibb.co/JBXSgdG/Screenshot-2023-02-23-at-13-02-56.png" alt="Screenshot-2023-02-23-at-13-02-56" border="0"></a>'
html="$(pbpaste)"

regex='src="([^"]+)"'
if [[ $html =~ $regex ]]; then
    echo "${BASH_REMATCH[1]}" 
    echo "${BASH_REMATCH[1]}" | pbcopy
else
    echo "No se encontró ninguna URL de imagen en el código HTML proporcionado."
fi
