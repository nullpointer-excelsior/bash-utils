#!/bin/bash


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Contrl + C function for a clean exit
function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Exiting...${endColour}"; sleep 1
	tput cnorm; exit 1
}

# usage
function usage {
        echo "Usage: $(basename $0) [-abcd]" 2>&1
        echo '   -a   shows a in the output'
        echo '   -b   shows b in the output'
        echo '   -c   shows c in the output'
        echo '   -d   shows d in the output'
        exit 1
}

if [[ ${#} -eq 0 ]]; then
   usage
fi

# Define list of arguments expected in the input
optstring=":abcd"

while getopts ${optstring} arg; do
  case "${arg}" in
    a) echo "Option 'a' was called" ;;
    b) echo "Option 'b' was called" ;;
    c) echo "Option 'c' was called" ;;
    d) echo "Option 'd' was called" ;;

    ?)
      echo "Invalid option: -${OPTARG}."
      echo
      usage
      ;;
  esac
done

# Debug output
echo "All ARGS: ${@}"
echo "1st arg: $1"
echo "2nd arg: $2"
echo "3rd arg: $3"
echo "4th arg: $4"

# Inspect OPTIND
echo "OPTIND: $OPTIND"
