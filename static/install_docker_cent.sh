#!/bin/bash
. common.lib

FILE="install_docker_cent.sh"

function oscheck() { # OS Check
    CATOS=$(sudo cat /etc/os-release | grep -w ID | cut -d '"' -f 2)

    if test "$CATOS" = 'centos'
    then
        echo "» Installing packages..."
        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && fnewL
        echo "» Installing docker engine..."
        sudo yum install -y docker-ce docker-ce-cli containerd.io
        sudo systemctl start docker && fnewLL
        echo "» Testing docker with hello-world..."
        sudo docker run hello-world
        fdone # finished operation message
        frmall # remove all downloaded CLIMYID files

    else
        f1baris
        echo -e "${LCYAN}Your OS is not supported yet. Exiting now.${CDEF}"
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

oscheck