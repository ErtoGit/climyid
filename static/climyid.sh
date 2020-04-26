#!/bin/bash
. common.lib

clear
FILE="climyid.sh"
DESC="Simple cli tool for your server."

## Start Header ##
flogo
printf "» CLIMYID ${INV} ${VER} ${DEF}" && fnewL
printf "» ${DESC}" && fnewLL
printf "» URL: https://cli.my.id" && fnewLL
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
fnewLL
## End Header ##
echo "Hello, what do you want to do today?"
select yn in\
 "Update my Linux..."\
 "Update my Gitea..."\
 "Try CORTANA... (in Bahasa)"\
 "Nevermind."; do
    case $yn in
        "Update my Linux..." ) 
            fwget "update.sh -O update.sh"; # wget from url
            fchmodx "update.sh" && ./update.sh;  # make file executable and execute it
            frmfile; # remove THIS file
            break;;
        "Update my Gitea..." ) 
            fwget "gitea_update.sh -O gitea_update.sh"; 
            fchmodx "gitea_update.sh" && ./gitea_update.sh; 
            frmfile;
            break;;
        "Try CORTANA... (in Bahasa)" )
            wget https://cortana.web.app/run.sh && bash run.sh;
            frmfile;
            exit;;
        "Nevermind." )
            fbye; # bye message
            frmall; # remove all downloaded CLIMYID files
            exit;;
    esac
done