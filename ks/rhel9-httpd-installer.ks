lang en_US.UTF-8
keyboard us
timezone Etc/UTC --utc
text

zerombr
clearpart --all --initlabel
autopart --type=plain
rootpw --lock

reboot

network --bootproto=dhcp
ostreesetup --osname=rhel --remote=edge --url=file:///run/install/repo/ostree/repo --ref=rhel/9/x86_64/edge --nogpg

%post --log=/var/log/anaconda/post-install.log --erroronfail

useradd -g wheel core
echo "core:redhat123" | chpasswd

%end
