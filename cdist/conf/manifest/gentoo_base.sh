# Every machine becomes a marker, so sysadmins know that automatic
# configurations are happening
__file /etc/cdist-configured
__cdistmarker

__directory /home/ec2-user/.liricco --owner ec2-user --group ec2-user
require="__directory/home/ec2-user/.liricco" __file /home/ec2-user/.liricco/valta.pem --source "${HOME}/.liricco/valta.pem" --mode 600
__ssh_dot_ssh root
require="__ssh_dot_ssh/root" __ssh_authorized_keys ec2-user \
   --key "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUcv2HlijCb1FyeFpTd1fkWqX+frX0EsQAEMj8AGXkH+BoK+CRZwF+ezOjfDl0Znzd40bwdSkoIMM7UT8A6DtJpZy/EOGcQZHdzbfr4w+A0SkoczSvDrKUNhM6LgXNHOqPf0+Ypm2zYsf10Ks/FAQVb1ma9TPJF+3pgPM/Et9AIaLUPiCbLEYSBnbygFgOAtox48dqXO/VVlS774a/BxbCOfMEa+mUwNaSxnGK4MrB+oOVKpwAixog3LJ0sWtgkj6ynI35EmS+JvflJlfAGYm1MbGW4wTYPRwst0N0Wg3MZYBX9ThHJ8KHw3oXEvwNULyPr0LXfqWYAQVObvR2ygrn Steven Lai@StevenLai"
require="__ssh_dot_ssh/root" __file /root/.ssh/config --source - << DONE
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
