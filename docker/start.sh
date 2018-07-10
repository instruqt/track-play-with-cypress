#!/bin/sh
for i in $(set | grep "CYPRESS_" | cut -f1 -d=); do unset $i; done

export DISPLAY=:11
/home/user/node_modules/cypress/bin/cypress open > /home/user/cypress.log 2>&1 &

node "/var/brackets-server/nodespeedide" -d -s /root/.brackets-server -j /home/user/cypress/integration
