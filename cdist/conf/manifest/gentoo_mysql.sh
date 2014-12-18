. $__manifest/gentoo_base.sh
__package dev-db/mysql --state present
require="__package/dev-db/mysql" __mysql_gentoo_config
password="$(echo "$RANDOM"|md5sum|cut -c-10)"
__file /root/.my.cnf --source - << EOF
[client]
password="$password"
EOF
require="__file/root/.my.cnf" __mysql_database "asterisk" --name "asterisk" --user "asterisk" --password "asterisk"
