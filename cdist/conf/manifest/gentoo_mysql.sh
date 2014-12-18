. $__manifest/gentoo_base.sh
__package dev-db/mysql --state present
require="__package/dev-db/mysql" __mysql_gentoo_config
require="__mysql_gentoo_config" __mysql_database "asterisk" --name "asterisk" --user "asterisk" --password "asterisk"
