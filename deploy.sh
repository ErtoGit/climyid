#!/bin/bash

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
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
2baris
## End Header ##

echo ">> Generating static files.."
hugo && sleep 1
1baris
echo ">> Push updates to GIT.."
git add . && sleep 1
echo "Enter message for commit process?"
read GIT_COMMENT && sleep 1
git commit -am "${GIT_COMMENT}" && sleep 1
git push -u origin master && sleep 1
1baris
echo ">> Deploying to Firebase.."
firebase login
firebase deploy
1baris
echo "✔ ALL DONE."