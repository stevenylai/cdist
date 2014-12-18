# Every machine becomes a marker, so sysadmins know that automatic
# configurations are happening
__file /etc/cdist-configured
__cdistmarker

__directory /root/.ssh --mode 0700
require="__directory/root/.ssh" __file /root/.ssh/config --source - << DONE
Host github.com StrictHostKeyChecking no
DONE

require="__file/root/.ssh/config" __git /usr/src/config --source https://github.com/stevenylai/config.git
require="__git/usr/src/config" __link /etc/portage/package.accept_keywords --source /usr/src/config/etc/portage/package.accept_keywords --type symbolic
require="__git/usr/src/config" __link /etc/portage/package.env --source /usr/src/config/etc/portage/package.env --type symbolic
require="__git/usr/src/config" __link /etc/portage/package.keywords --source /usr/src/config/etc/portage/package.keywords --type symbolic
require="__git/usr/src/config" __link /etc/portage/package.license --source /usr/src/config/etc/portage/package.license --type symbolic
require="__git/usr/src/config" __link /etc/portage/package.mask --source /usr/src/config/etc/portage/package.mask --type symbolic
require="__git/usr/src/config" __link /etc/portage/package.unmask --source /usr/src/config/etc/portage/package.unmask --type symbolic
require="__git/usr/src/config" __link /etc/portage/package.use --source /usr/src/config/etc/portage/package.use --type symbolic
