. $__manifest/gentoo_base.sh
__package net-misc/asterisk --state present
require="__package/net-misc/asterisk" __asterisk_config
mysql_password=$(cat "${HOME}/.liricco/${env}/mysql/password")
__asterisk_config --mysql_password $mysql_password
