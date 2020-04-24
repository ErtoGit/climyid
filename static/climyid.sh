#!/bin/bash

clear
FILE="climyid.sh"
VER="v0.2"
CDEF="\e[39m"
LCYAN="\e[96m"
LGREN="\e[92m"
DEF="\e[0m"
INV="\e[7m"

## Start Header ##
function 1baris() {
    printf "\n"
}
function 2baris() {
    printf "\n\n"
}
printf "\n${LGREN}"
printf "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄" && 1baris
printf "██ ▄▄▀██ ████▄ ▄██ ▄▀▄ ██ ███ █▄ ▄██ ▄▄▀██" && 1baris
printf "██ █████ █████ ███ █ █ ██▄▀▀▀▄██ ███ ██ ██" && 1baris
printf "██ ▀▀▄██ ▀▀ █▀ ▀██ ███ ████ ███▀ ▀██ ▀▀ ██" && 1baris
printf "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀" && printf "${CDEF}\n\n"
printf "» CLIMYID ${INV} ${VER} ${DEF}" && 1baris
printf "» URL: https://cli.my.id" && printf "\n\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
2baris
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