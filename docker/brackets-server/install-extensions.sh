#!/bin/bash

# Install the default recommended extensions for nodeSpeed IDE
echo "Installing default nodedSpeed IDE extensions installed."


cd /home/user/.brackets-server/extensions/user

git clone https://github.com/Jacse/themes-for-brackets.git
cd themes-for-brackets
npm install

cd ..
git clone https://github.com/whoGloo/brackets-file-upload.git
cd brackets-file-upload
npm install

echo "Default nodedSpeed IDE extensions installed."
