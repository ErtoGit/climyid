#!/bin/bash

echo ">> Generating static files.."
hugo && sleep 1
printf "\n"
echo ">> Push updates to GIT.."
git add . && sleep 1
echo "Apa yang diubah kali ini?"
read GIT_COMMENT && sleep 1
git commit -am "${GIT_COMMENT}" && sleep 1
git push -u origin master && sleep 1
printf "\n"
echo ">> Deploying to Firebase.."
firebase login
firebase deploy
printf "\n"
echo ">> ALL DONE."