. $__manifest/gentoo_base.sh
__package dev-db/couchdb --state present
require="__package/dev-db/couchdb" __process /usr/bin/couchdb --state present --start "/etc/init.d/couchdb start" --stop "/etc/init.d/couchdb stop"
require="__process /usr/bin/couchdb" __cron compact --user ec2-user --command "curl -H 'Content-Type: application/json' -X POST http://localhost:5984/pyhub/_compact" --minute 0
