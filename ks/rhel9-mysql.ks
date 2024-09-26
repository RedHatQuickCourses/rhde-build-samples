lang en_US.UTF-8
keyboard us
timezone Etc/UTC --isUtc
text

zerombr
clearpart --all --initlabel
autopart --type=plain
rootpw --lock
user --name=core --group=wheel --password=redhat

reboot

network --bootproto=dhcp
ostreesetup --nogpg --osname=rhel --remote=edge --url=http://servera.lab.example.com/repo/ --ref=rhel/9/x86_64/db
