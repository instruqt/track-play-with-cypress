#!/bin/sh
for i in $(set | grep "CYPRESS_" | cut -f1 -d=); do unset $i; done

export DISPLAY=:11
node "/var/brackets-server/nodespeedide" -d -s /root/.brackets-server -j /home/user/cypress/integration &

/home/user/node_modules/cypress/bin/cypress open
