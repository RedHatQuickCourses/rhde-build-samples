lang en_US.UTF-8
keyboard us
timezone Etc/UTC --utc
text

zerombr
clearpart --all --initlabel
autopart --type=plain
rootpw --lock
user --name=core --group=wheel --password=redhat123

reboot

network --bootproto=dhcp
ostreesetup --nogpg --osname=rhel --remote=db --url=http://servera.lab.example.com/repo/ --ref=rhel/9/x86_64/db
