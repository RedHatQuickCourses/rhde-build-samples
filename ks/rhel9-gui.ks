lang en_US.UTF-8
keyboard us
timezone Etc/UTC --utc
graphical

zerombr
clearpart --all --initlabel
autopart --type=plain
rootpw --lock

reboot

network --bootproto=dhcp 
ostreesetup --nogpg --osname=rhel --remote=edge --url=http://servera.lab.example.com/repo/ --ref=rhel/9/x86_64/kiosk

