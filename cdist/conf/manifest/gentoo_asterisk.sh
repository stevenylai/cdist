. $__manifest/gentoo_base.sh
__package net-misc/asterisk --state present
require="__package/net-misc/asterisk" __asterisk_config
__asterisk_config
