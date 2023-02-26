#!/bin/zsh

#Colours
declare -r greenColour="\e[0;32m\033[1m"
declare -r endColour="\033[0m\e[0m"
declare -r redColour="\e[0;31m\033[1m"
declare -r blueColour="\e[0;34m\033[1m"
declare -r yellowColour="\e[0;33m\033[1m"
declare -r purpleColour="\e[0;35m\033[1m"
declare -r turquoiseColour="\e[0;36m\033[1m"
declare -r grayColour="\e[0;37m\033[1m"


# Ctrl + C
trap ctrl_c INT
function ctrl_c(){
    tput cnorm
    echo -e "\n\n${redColour}[!] Exiting...${endColour}"
    exit 1
}

run_app="$1"

function help() {
  echo -e "${greenColour}File Finder${endColour}"
  echo -e "\n${yellowColour}Available options${endColour}\n"
  echo -e "${greenColour}--vscode:${endColour} Open visual code editor."
  echo -e "${greenColour}--vim:${endColour} Open vim editor."
  echo -e "${greenColour}--cat:${endColour} Show content with cat"
  echo -e "\n"
  exit 1
}

if [[ -z "$run_app" ]]; then
  clear
  echo -e "\n${yellowColour}[!]${endColour} You need to specify an option.\n"
  help
fi

nav_path="$PWD"
selected_file=""

clear

while true; do

  clear
  echo -e "\n${yellowColour}[*]${endColour} Showing directory: ${greenColour}$nav_path${endColour}\n"

  selection=$(ls -la $nav_path | awk '{ print $NF }' | awk 'NR>1' | fzf --preview='bat --color=always --line-range :300 {} 2>/dev/null || lsd -a --tree --depth=3 --color=always {}' --height 60% --reverse)

  if [[ -z "$selection" ]]; then  

    break

  fi

  if [ -f "$nav_path/$selection" ]; then
    
    selected_file="$nav_path/$selection"
    break

  elif [ -d "$nav_path/$selection" ]; then
    
    cd "$nav_path/$selection" 
    nav_path="$PWD"

  fi

done

clear

if [[ -z "$selection" ]]; then
  exit 0
fi

if [[ "$run_app" == "--cat" ]]; then
  bat "$selected_file"
elif [[ "$run_app" == "--vim" ]]; then
  nvim "$selected_file"
elif [[ "$run_app" == "--vscode" ]]; then
  code "$selected_file"
fi

