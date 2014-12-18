. $__manifest/gentoo_base.sh
__package dev-db/mysql --state present
__file /root/.my.cnf --source /home/stevenylai/.my.cnf
#require="__package/dev-db/mysql" __process
