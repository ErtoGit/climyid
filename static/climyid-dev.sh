#!/bin/bash
#
# https://source.my.id/erol/climyid
#
# Copyright (c) 2020 Erol Joudy. Released under the MIT License.

. common.lib

clear
VER="0.5alpha"
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

function lemp_distro() {
    CATOS=$(sudo cat /etc/os-release | grep -w ID | cut -d '=' -f 2)

    if test "$CATOS" = 'ubuntu'
    then
        fwget "install_lemp_ubn.sh -O install_lemp_ubn.sh"
        fchmodx "install_lemp_ubn.sh" && ./install_lemp_ubn.sh

    elif test "$CATOS" = 'debian'
    then
        fwget "install_lemp_deb.sh -O install_lemp_deb.sh" 
        fchmodx "install_lemp_deb.sh" && ./install_lemp_deb.sh

    else
        fnewL
        echo -e "${LCYAN}[CORTANA]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

function docker_distro() {
    CATOS=$(sudo cat /etc/os-release | grep -w ID | cut -d '=' -f 2)
    CATOSx=$(sudo cat /etc/os-release | grep -w ID | cut -d '"' -f 2)

    if test "$CATOS" = 'ubuntu'
    then
        fwget "install_docker_ubn.sh -O install_docker_ubn.sh"
        fchmodx "install_docker_ubn.sh" && ./install_docker_ubn.sh

    elif test "$CATOS" = 'debian'
    then
        fwget "install_docker_deb.sh -O install_docker_deb.sh" 
        fchmodx "install_docker_deb.sh" && ./install_docker_deb.sh

    elif test "$CATOSx" = 'centos'
    then
        fwget "install_docker_cent.sh -O install_docker_cent.sh" 
        fchmodx "install_docker_cent.sh" && ./install_docker_cent.sh

    else
        fnewL
        echo -e "${LCYAN}[CORTANA]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

menu () {
    echo "Hello, what do you want to do today?"
    echo "   1) Update my Linux..."
    echo "   2) Install LEMP Stack"
    echo "   3) Install Docker"
    echo "   4) Install WireGuard VPN (by Nyr)"
    echo "   5) Server Benchmark (YABS by masonr)"
    echo "   6) Update my Gitea..."
    echo "   7) Try CORTANA... (in Bahasa)"
    echo "   8) Exit"
    fnewL
    read -rp "Select an option [1]: " menuopt
    until [[ -z "$menuopt" || "$menuopt" =~ ^[1-8]$  ]]; do
        echo "$menuopt: invalid selection." && fnewL
        read -rp "Select an option [1]: " menuopt
    done
    case "$menuopt" in
        1|"")
            echo "Update my Linux..."
            fwget "update.sh -O update.sh" # wget from url
            fchmodx "update.sh" && ./update.sh  # make file executable and execute it
            exit;;
        2)
            echo "Install LEMP Stack"
            lemp_distro
            exit;;
        3)
            echo "Install Docker"
            docker_distro
            exit;;
        4)
            echo "Install WireGuard VPN (by Nyr)"
            fnewL
            wget https://git.io/wireguard -O wireguard-install.sh && bash wireguard-install.sh
            frmall && rm -fR wireguard-install.sh # remove all downloaded CLIMYID files
            exit;;
        5)
            echo "Server Benchmark (YABS by masonr)"
            fnewL
            curl -s https://raw.githubusercontent.com/masonr/yet-another-bench-script/master/yabs.sh | bash
            frmall && rm -fR yabs.sh # remove all downloaded CLIMYID files
            exit;;
        6)
            echo "Update my Gitea..."
            fwget "gitea_update.sh -O gitea_update.sh"
            fchmodx "gitea_update.sh" && ./gitea_update.sh
            exit;;
        7)
            echo "Try CORTANA... (in Bahasa)"
            frmall
            wget https://cortana.web.app/run.sh && bash run.sh
            frmfile
            exit;;
        8)
            echo "Later. (Exit)"
            fbye
            frmall
            exit;;
    esac
}

menu

# echo "Hello, what do you want to do today?"
# select yn in "Update my Linux..."\
#  "Install LEMP Stack"\
#  "Install Docker"\
#  "Install WireGuard VPN (by Nyr)"\
#  "Server Benchmark (YABS by masonr)"\
#  "Update my Gitea..."\
#  "Try CORTANA... (in Bahasa)"\
#  "Nevermind."; do
#     case $yn in
#         "Update my Linux..." ) 
#             fwget "update.sh -O update.sh"; # wget from url
#             fchmodx "update.sh" && ./update.sh;  # make file executable and execute it
#             break;;
#         "Install LEMP Stack..." ) 
#             lemp_distro;
#             break;;
#         "Install Docker..." ) 
#             docker_distro;
#             break;;
#         "Install WireGuard VPN (by Nyr)" ) 
#             fnewL
#             wget https://git.io/wireguard -O wireguard-install.sh && bash wireguard-install.sh; 
#             frmall && rm -fR wireguard-install.sh ; # remove all downloaded CLIMYID files
#             break;;
#         "Server Benchmark (YABS by masonr)" ) 
#             fnewL
#             curl -s https://raw.githubusercontent.com/masonr/yet-another-bench-script/master/yabs.sh | bash; 
#             frmall && rm -fR yabs.sh ; # remove all downloaded CLIMYID files
#             break;;
#         "Update my Gitea..." ) 
#             fwget "gitea_update.sh -O gitea_update.sh"; 
#             fchmodx "gitea_update.sh" && ./gitea_update.sh; 
#             break;;
#         "Try CORTANA... (in Bahasa)" )
#             frmall;
#             wget https://cortana.web.app/run.sh && bash run.sh;
#             frmfile;  # remove THIS file
#             break;;
#         "Nevermind." )
#             fbye; # bye message
#             frmall;
#             exit;;
#     esac
# done