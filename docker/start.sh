#!/bin/sh
for i in $(set | grep "CYPRESS_" | cut -f1 -d=); do unset $i; done

export DISPLAY=:11
node "/var/brackets-server/nodespeedide" -j /projects -s /root/.brackets-server &

/home/user/node_modules/cypress/bin/cypress open