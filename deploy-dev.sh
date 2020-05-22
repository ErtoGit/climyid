#!/bin/bash
. static/common.lib

## Start Header ##
flogo
## End Header ##

echo "» Generating static files.."
hugo && sleep 1
#fnewL
#echo ">> Push updates to GIT.."
#git add . && sleep 1
#echo "Enter message for commit process?"
#read -r GIT_COMMENT && sleep 1
#git commit -am "${GIT_COMMENT}" && sleep 1
#git push -u origin master && sleep 1
fnewL
echo "» Deploying to Firebase.."
firebase login
firebase deploy
fnewL
fdone