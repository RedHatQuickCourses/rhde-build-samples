lang en_US.UTF-8
keyboard us
timezone Etc/UTC --utc
graphical

zerombr
clearpart --all --initlabel
#autopart --type=lvm --fstype=xfs --nohome
part /boot/efi --fstype=efi --size=200
part /boot --fstype=xfs --asprimary --size=800
part pv.01 --grow
volgroup rhel pv.01
logvol / --vgname=rhel --fstype=xfs --size=10240 --name=root

rootpw --lock
firewall --enabled --ssh
selinux --enforcing

user --name=student --password=student --groups=wheel

firstboot --disable
reboot

# Run 'hostnamectl set-hostname' after installation to change it for use with libvirtnss
network --bootproto=dhcp --hostname=rhelvm99

url --url="http://classroom.lab.example.com/content/rhel9.4/x86_64/dvd"
repo --name="AppStream" --baseurl="http://classroom.lab.example.com/content/rhel9.4/x86_64/dvd/AppStream"

%packages
@Server with GUI
%end

