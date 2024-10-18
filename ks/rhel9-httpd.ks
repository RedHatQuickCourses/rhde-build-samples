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
ostreesetup --nogpg --osname=rhel --remote=edge --url=http://servera.lab.example.com/repo/ --ref=rhel/9/x86_64/edge

%post --log=/var/log/anaconda/post-install.log --erroronfail

useradd -g wheel core
echo "core:redhat123" | chpasswd

%end
