lang en_US.UTF-8
keyboard us
timezone Etc/UTC --utc
text

zerombr
clearpart --all --initlabel
#autopart --type=lvm --fstype=xfs --nohome
part /boot/efi --fstype=efi --size=200
part /boot --fstype=xfs --asprimary --size=800
part pv.01 --grow
volgroup rhel pv.01
logvol / --vgname=rhel --fstype=xfs --size=10240 --name=root

rootpw --lock

reboot

network --bootproto=dhcp 
ostreesetup --nogpg --osname=rhel --remote=edge --url=http://servera.lab.example.com/repo/ --ref=rhel/9/x86_64/base

