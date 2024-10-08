lang en_US.UTF-8
keyboard us
timezone Etc/UTC --isUtc
text

zerombr
clearpart --all --initlabel
autopart --type=plain
rootpw --lock
user --name=core --group=wheel --password=redhat123

reboot

network --bootproto=dhcp
ostreesetup --osname=rhel --url=file:///run/install/repo/ostree/repo --ref=rhel/9/x86_64/db --nogpg
