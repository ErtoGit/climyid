#!/bin/bash

printf "\n"
echo "Do you wish to check for updates?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo yum update -y; yum list --upgradeable; break;;
        No ) exit;;
    esac
done
sleep 1
echo "Do you wish to upgrade?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo yum upgrade -y; sudo yum autoremove -y; break;;
        No ) exit;;
    esac
done
rm -fR centos_update.sh