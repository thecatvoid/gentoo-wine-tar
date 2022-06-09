#!/bin/bash

set -x e

chroot /gentoo/ /bin/bash -c 'set -x e

. /etc/profile

ln -sf /var/db/repos/gentoo/profiles/default/linux/amd64/17.1/systemd /etc/portage/make.profile

emerge-webrsync

emerge dev-vcs/git

rm -rf /var/db/repos/* /var/cache

mv $HOME/gentoo.conf /etc/portage/repos.conf

emerge --sync

(while true; do etc-update --automode -5; done &) > /dev/null 2>&1

(for i in $(cat /etc/portage/package-list); do emerge $i && echo merged; done)'
