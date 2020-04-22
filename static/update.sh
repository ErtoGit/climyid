#!/bin/bash

FILEN="update.sh"
printf "\n"
echo "Okay, please choose your distro."
select yn in "CentOS" "Debian" "Ubuntu" "Not now!"; do
    case $yn in
        CentOS ) 
            VARC="centos";
            sudo wget -q https://cli.my.id/${VARC}_${FILEN} -O ${VARC}_${FILEN}; 
            sudo chmod +x ${VARC}_${FILEN};
            ./${VARC}_${FILEN}; 
            rm -fR $FILEN;
            break;;
        Debian ) 
            VARD="debian";
            sudo wget -q https://cli.my.id/${VARD}_${FILEN} -O ${VARD}_${FILEN}; 
            sudo chmod +x ${VARD}_${FILEN};
            ./${VARD}_${FILEN};
            rm -fR $FILEN;
            break;;
        Ubuntu ) 
            VARU="ubuntu";
            sudo wget -q https://cli.my.id/${VARU}_${FILEN} -O ${VARU}_${FILEN}; 
            sudo chmod +x ${VARU}_${FILEN};
            ./${VARU}_${FILEN};
            rm -fR $FILEN;
            break;;
        "Not now!" )
            echo "Bye!";
            rm -fR $FILEN;
            exit;;
    esac
done