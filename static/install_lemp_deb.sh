#!/bin/bash
. common.lib

FILE="install_lemp_deb.sh"

fnewL
echo -e "${LCYAN}Things that will be installed in this LEMP Stack.${CDEF}"
echo -e "[1] NGINX"
echo -e "[2] Fail2ban"
echo -e "[3] MySQL"
echo -e "[4] PHP 7.4"
echo -e "[5] Certbot PPA (Let's Encrypt)" && fnewLL
echo -e "${LCYAN}Continue?${CDEF}"
select yn in "YES" "Later"; do
    case $yn in
        YES ) 
            echo -e "${LCYAN}[1]  Installing NGINX...${CDEF}";
            sudo apt install nginx -y;
            echo -e "${LCYAN}i  Installing NGINX:${CDEF} Checking version.";
            nginx -v;
            echo -e "${LCYAN}i  Installing NGINX:${CDEF} Configuring firewall.";
            sudo ufw disable;
            sudo ufw allow 'Nginx Full';
            sudo ufw enable;
            echo -e "${LGREN}✔  Installing NGINX:${CDEF} Done.";
            echo "You may open http://your_server_domain_or_IP in browser." && fnewL;
            echo -e "${LCYAN}[2]  Installing Fail2ban...${CDEF}";
            sudo apt install fail2ban -y;
            sudo service fail2ban start;
            echo -e "${LGREN}✔  Installing Fail2ban:${CDEF} Done." && fnewL;
            echo -e "${LCYAN}[3]  Installing MySQL...${CDEF}";
            sudo apt install mysql-server -y;
            echo -e "${LCYAN}i  Installing MySQL:${CDEF} Checking version.";
            mysqld --version;
            echo -e "${LCYAN}i  Installing MySQL:${CDEF} Securing installation.";
            sudo mysql_secure_installation;
            echo -e "${LGREN}✔  Installing MySQL:${CDEF} Done." && fnewL;
            echo -e "${LCYAN}[4]  Installing PHP 7.4...${CDEF}";
            sudo apt install software-properties-common -y;
            sudo add-apt-repository ppa:ondrej/php;
            sudo apt update -y;
            sudo apt install php7.4-fpm php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip unzip -y;
            echo -e "${LCYAN}i  Installing PHP 7.4:${CDEF} Checking version.";
            php -v;
            echo -e "${LGREN}✔  Installing PHP 7.4:${CDEF} Done." && fnewL;
            echo -e "${LCYAN}[5]  Installing Certbot PPA...${CDEF}";
            #sudo add-apt-repository universe;
            #sudo add-apt-repository ppa:certbot/certbot;
            #sudo apt-get update -y;
            sudo apt-get install certbot python-certbot-nginx -y;
            sudo certbot --nginx;
            echo -e "${LCYAN}i  Installing Certbot PPA:${CDEF} Testing automatic renewal.";
            sudo certbot renew --dry-run;
            echo -e "${LGREN}✔  Installing Certbot PPA:${CDEF} Done.";
            echo "To confirm that your site is set up properly, visit https://yourwebsite.com/ in your browser and look for the lock icon in the URL bar." && fnewL;
            fdone && fnewL;
            frmall; # remove all downloaded files
            break;;
        Later )
            fbye; # Bye message from Cortana
            frmall; # remove all downloaded files
            exit;;
    esac
done