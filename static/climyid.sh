#!/bin/bash

printf "\n"
echo "----------------------------"
echo "       CLIMYID v0.1"
echo "----------------------------"
printf "\n"
echo "Hello, what do you want to do today?"
select yn in "Update my Linux" "Nevermind."; do
    case $yn in
        "Update my Linux" ) 
            sudo wget -q https://cli.my.id/update.sh -O update.sh; 
            sudo chmod +x update.sh;
            ./update.sh; 
            break;;
        "Nevermind." )
            echo "Bye!";
            rm -fR climyid.sh;
            exit;;
    esac
done