. $__manifest/gentoo_base.sh
__package net-misc/asterisk --state present
mysql_password=$(cat "${HOME}/.liricco/${env}/mysql/password")
require="__package/net-misc/asterisk" __asterisk_config $env --mysql_password $mysql_password
