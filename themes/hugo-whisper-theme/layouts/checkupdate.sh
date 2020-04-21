#!/bin/bash

echo "Do you wish to check for updates?"
select yn in "Yes" "No"; do
        case $yn in
                Yes ) sudo apt update -y; apt list --upgradeable; break;;
                No ) exit;;
        esac
done
sleep 1
echo "Do you wish to upgrade?"
select yn in "Yes" "No"; do
        case $yn in
                Yes ) sudo apt upgrade -y; break;;
                No ) exit;;
        esac
done