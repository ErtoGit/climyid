#!/bin/bash
. common.lib

clear
VER="0.4"
FILE="climyid.sh"
DESC="Simple cli tool for your server."

## Start Header ##
flogo
echo -e "» CLIMYID ${INV} ${VER} ${DEF}" && fnewL
echo -e "» ${DESC}" && fnewLL
printf "» URL: https://cli.my.id" && fnewLL
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
fnewLL
## End Header ##
echo "Hello, what do you want to do today?"
select yn in "Update my Linux..."\
 "Install LEMP Stack (Ubuntu)..."\
 "Install LEMP Stack (Debian)..."\
 "Server Benchmark (YABS by masonr)"\
 "Update my Gitea..."\
 "Try CORTANA... (in Bahasa)"\
 "Nevermind."; do
    case $yn in
        "Update my Linux..." ) 
            fwget "update.sh -O update.sh"; # wget from url
            fchmodx "update.sh" && ./update.sh;  # make file executable and execute it
            break;;
        "Install LEMP Stack (Ubuntu)..." ) 
            fwget "install_lemp_ubn.sh -O install_lemp_ubn.sh"; 
            fchmodx "install_lemp_ubn.sh" && ./install_lemp_ubn.sh; 
            break;;
        "Install LEMP Stack (Debian)..." ) 
            fwget "install_lemp_deb.sh -O install_lemp_deb.sh"; 
            fchmodx "install_lemp_deb.sh" && ./install_lemp_deb.sh; 
            break;;
        "Server Benchmark (YABS by masonr)" ) 
            fnewL
            curl -s https://raw.githubusercontent.com/masonr/yet-another-bench-script/master/yabs.sh | bash; 
            frmall && rm -fR ; # remove all downloaded CLIMYID files
            break;;
        "Update my Gitea..." ) 
            fwget "gitea_update.sh -O gitea_update.sh"; 
            fchmodx "gitea_update.sh" && ./gitea_update.sh; 
            break;;
        "Try CORTANA... (in Bahasa)" )
            frmall;
            wget https://cortana.web.app/run.sh && bash run.sh;
            frmfile;  # remove THIS file
            break;;
        "Nevermind." )
            fbye; # bye message
            frmall;
            exit;;
    esac
done