#!/bin/bash

FILE="gitea_update.sh"

printf "\n"
echo ">> Stopping Gitea..." && printf "\n"
sudo systemctl stop gitea && sleep 1
echo "Please enter the new version of Gitea. Please check here, https://dl.gitea.io/gitea/" && printf "\n"
read VERSION
echo ">> Downloading new version of Gitea..." && printf "\n"
wget -O /tmp/gitea https://dl.gitea.io/gitea/${VERSION}/gitea-${VERSION}-linux-amd64 && sleep 1
echo ">> Installing new version of Gitea..." && printf "\n"
sudo mv /tmp/gitea /usr/local/bin && sleep 1
sudo chmod +x /usr/local/bin/gitea && sleep 1
sudo systemctl restart gitea
echo "✔ ALL DONE."
rm -fR $FILE;
