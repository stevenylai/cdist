. $__manifest/gentoo_base.sh
__package dev-db/mysql --state present
mkdir -p ${HOME}/.liricco/${env}/mysql
if [ ! -f "${HOME}/.liricco/${env}/mysql/password" ]; then
    echo "$RANDOM"|md5sum|cut -c-10 > "${HOME}/.liricco/${env}/mysql/password"
fi
mysql_password=$(cat "${HOME}/.liricco/${env}/mysql/password")
__file /root/.my.cnf --source - << EOF
[client]
password="$mysql_password"
EOF
require="__package/dev-db/mysql __file/root/.my.cnf" __mysql_gentoo_config
require="__mysql_gentoo_config" __process /usr/sbin/mysqld --state present --start "/etc/init.d/mysql start" --stop "/etc/init.d/mysql stop"
require="__process/usr/sbin/mysqld" __mysql_database "asterisk" --name "asterisk" --user "asterisk" --password "$mysql_password"
