#!/bin/sh

printf "\n"
echo "Please choose your distro."
select yn in "CentOS" "Debian" "Ubuntu" "Not now!"; do
    case $yn in
        CentOS ) 
            VARC="centos";
            sudo wget -q https://cli.my.id/${VARC}_update.sh -O climyid/${VARC}_update.sh; 
            sudo chmod+x ${VARC}_update.sh;
            ./${VARC}_update.sh; 
            break;;
        Debian ) 
            VARD="debian";
            sudo wget -q https://cli.my.id/${VARD}_update.sh -O climyid/${VARD}_update.sh; 
            sudo chmod+x ${VARD}_update.sh;
            ./${VARD}_update.sh;
            break;;
        Ubuntu ) 
            VARU="ubuntu";
            sudo wget -q https://cli.my.id/${VARU}_update.sh -O climyid/${VARU}_update.sh; 
            sudo chmod+x ${VARU}_update.sh;
            ./${VARU}_update.sh;
            break;;
        "Not now!" )
            exit;;
    esac
done
