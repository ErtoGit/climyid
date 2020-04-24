#!/bin/bash

FILE="kali_update.sh"

DISTRO=$(sudo cat /etc/os-release | grep -w NAME | cut -d '"' -f 2)

echo "Do you wish to check for your ${DISTRO} updates now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo apt update -y; 
            apt list --upgradeable; 
            rm -fR $FILE;
            break;;
        No ) 
            echo "Bye.";
            rm -fR $FILE;
            exit;;
    esac
done
sleep 1
echo "Do you wish to upgrade it?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo apt upgrade -y; 
            sudo apt autoremove -y; 
            rm -fR $FILE;
            break;;
        No ) 
            echo "Bye.";
            rm -fR $FILE;
            exit;;
    esac
done