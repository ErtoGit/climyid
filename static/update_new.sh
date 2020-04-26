#!/bin/bash

FILEN="update_new.sh"

function 1baris() {
    printf "\n"
}

function autocheck() {
    DISTRO=$(sudo cat /etc/os-release | grep -w ID | cut -d '=' -f 2)
    DISTRO2=$(sudo cat /etc/os-release | grep -w ID | cut -d '"' -f 2)

    if [ $DISTRO = 'ubuntu' ]
    then
        VARU="ubuntu";
        sudo wget -q https://cli.my.id/${VARU}_${FILEN} -O ${VARU}_${FILEN}; 
        sudo chmod +x ${VARU}_${FILEN};
        ./${VARU}_${FILEN};
        rm -fR $FILEN;
    
    elif [ $DISTRO = 'kali' ]
    then
        VARK="kali";
        sudo wget -q https://cli.my.id/${VARK}_${FILEN} -O ${VARK}_${FILEN}; 
        sudo chmod +x ${VARK}_${FILEN};
        ./${VARK}_${FILEN};
        rm -fR $FILEN;
    
    elif [ $DISTRO = 'debian' ]
    then
        VARD="debian";
        sudo wget -q https://cli.my.id/${VARD}_${FILEN} -O ${VARD}_${FILEN}; 
        sudo chmod +x ${VARD}_${FILEN};
        ./${VARD}_${FILEN};
        rm -fR $FILEN;
    
    elif [ $DISTRO2 = 'centos' ]
    then
        VARC="centos";
        sudo wget -q https://cli.my.id/${VARC}_${FILEN} -O ${VARC}_${FILEN}; 
        sudo chmod +x ${VARC}_${FILEN};
        ./${VARC}_${FILEN}; 
        rm -fR $FILEN;
    
    else
        1baris
        echo "Unable to define your distro! Wanna try our supported update script close to your distro?"
        select yn in "CentOS..." "Debian..." "Ubuntu..." "Kali..." "Maybe next time."; do
            case $yn in
                "CentOS..." ) 
                    VARC="centos";
                    sudo wget -q https://cli.my.id/${VARC}_${FILEN} -O ${VARC}_${FILEN}; 
                    sudo chmod +x ${VARC}_${FILEN};
                    ./${VARC}_${FILEN}; 
                    rm -fR $FILEN;
                    break;;
                "Debian..." ) 
                    VARD="debian";
                    sudo wget -q https://cli.my.id/${VARD}_${FILEN} -O ${VARD}_${FILEN}; 
                    sudo chmod +x ${VARD}_${FILEN};
                    ./${VARD}_${FILEN};
                    rm -fR $FILEN;
                    break;;
                "Ubuntu..." ) 
                    VARU="ubuntu";
                    sudo wget -q https://cli.my.id/${VARU}_${FILEN} -O ${VARU}_${FILEN}; 
                    sudo chmod +x ${VARU}_${FILEN};
                    ./${VARU}_${FILEN};
                    rm -fR $FILEN;
                    break;;
                "Kali..." ) 
                    VARK="kali";
                    sudo wget -q https://cli.my.id/${VARK}_${FILEN} -O ${VARK}_${FILEN}; 
                    sudo chmod +x ${VARK}_${FILEN};
                    ./${VARK}_${FILEN};
                    rm -fR $FILEN;
                    break;;
                "Maybe next time." )
                    echo "Bye.";
                    rm -fR $FILEN;
                    exit;;
            esac
        done
    fi
}

1baris
echo ">> Okay, checking your distro version..."
autocheck