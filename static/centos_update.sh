#!/bin/bash

FILE="centos_update.sh"
printf "\n"
echo "Do you wish to check for your CentOS updates now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo yum check-update -y; 
            rm -fR $FILE;
            break;;
        No ) 
            echo "Bye!";
            rm -fR $FILE;
            exit;;
    esac
done
sleep 1
echo "Do you wish to upgrade it?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo yum update -y; 
            sudo yum autoremove -y; 
            rm -fR $FILE;
            break;;
        No ) 
            echo "Bye!";
            rm -fR $FILE;
            exit;;
    esac
done