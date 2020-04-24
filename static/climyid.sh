#!/bin/bash

#clear
FILE="climyid.sh"
VER="v0.1.1"
CDEF="\e[39m"
LCYAN="\e[96m"
LGREN="\e[92m"
DEF="\e[0m"
INV="\e[7m"

## Start Header ##
printf "\n${LGREN}"
printf "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄" && printf "\n"
printf "██ ▄▄▀██ ████▄ ▄██ ▄▀▄ ██ ███ █▄ ▄██ ▄▄▀██" && printf "\n"
printf "██ █████ █████ ███ █ █ ██▄▀▀▀▄██ ███ ██ ██" && printf "\n"
printf "██ ▀▀▄██ ▀▀ █▀ ▀██ ███ ████ ███▀ ▀██ ▀▀ ██" && printf "\n"
printf "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀" && printf "${CDEF}\n\n"
printf "» CLIMYID ${INV} ${VER} ${DEF}" && printf "\n"
#printf "» URL: https://cli.my.id" && printf "\n\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
printf "\n\n"
## End Header ##
echo "Hello, what do you want to do today?"
select yn in "Update my Linux" "Update my Windows" "Nevermind."; do
    case $yn in
        "Update my Linux" ) 
            sudo wget -q https://cli.my.id/update.sh -O update.sh; 
            sudo chmod +x update.sh;
            ./update.sh; 
            rm -fR $FILE;
            break;;
        "Update my Windows" )
            echo "GO AWAY!!";
            rm -fR $FILE;
            exit;;
        "Nevermind." )
            echo "Bye!";
            rm -fR $FILE;
            exit;;
    esac
done