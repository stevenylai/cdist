. $__manifest/gentoo_base.sh
__package dev-db/couchdb --state present
__process /usr/bin/couchdb --state present --start "/etc/init.d/couchdb start" --stop "/etc/init.d/couchdb stop"
