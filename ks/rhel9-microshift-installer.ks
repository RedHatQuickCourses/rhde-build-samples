lang en_US.UTF-8
keyboard us
timezone Etc/UTC --utc
text

zerombr
clearpart --all --initlabel
part /boot/efi --fstype=efi --size=200
part /boot --fstype=xfs --asprimary --size=800
part pv.01 --grow
volgroup rhel pv.01
logvol / --vgname=rhel --fstype=xfs --size=10240 --name=root

rootpw --lock
reboot

network --bootproto=dhcp 
ostreesetup --nogpg --osname=rhel --remote=edge --url=file:///run/install/repo/ostree/repo --ref=rhel/9/x86_64/ushift

# Will I need scripts here to configure image policy, disable signatures, and provision namespace/sa?
%post --log=/var/log/anaconda/post-install.log --erroronfail

# Make kubeconfig available for local user
sudo cp /var/lib/microshift/resources/kubeadmin/kubeconfig /home/core/local-admin
sudo chown core /home/core/local-admin
chmod a-w /home/core/local-admin

# local user for console login and SSH
useradd -g wheel core
echo "core:redhat123" | chpasswd
mkdir /home/core/.ssh
cat > /home/core/.ssh/authorized_keys << EOFSSH
REPLACE_WTH_SSH_PUB_KEY
EOFSSH

%end
