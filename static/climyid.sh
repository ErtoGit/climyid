#!/bin/bash

FILE="climyid.sh"
printf "\n"
echo "------------------------------------"
echo "            CLIMYID v0.1"
echo "         https://cli.my.id/"
echo "------------------------------------"
printf "\n"
echo "Hello, what do you want to do today?"
select yn in "Update my Linux" "Update my Windows" "Nevermind."; do
    case $yn in
        "Update my Linux" ) 
            sudo wget -q https://cli.my.id/update.sh -O update.sh; 
            sudo chmod +x update.sh;
            ./update.sh; 
            rm -fR $FILE;
            break;;
        "Update my Windows" )
            echo "GO AWAY!!";
            rm -fR $FILE;
            exit;;
        "Nevermind." )
            echo "Bye!";
            rm -fR $FILE;
            exit;;
    esac
done