chown -R swift:swift /etc/swift

mkdir -p /srv/node/loop2

dd if=/dev/zero of=/mnt/object-volume1 bs=1 count=0 seek=10G
losetup /dev/loop2 /mnt/object-volume1
mkfs.xfs -i size=1024 /dev/loop2
echo "/dev/loop2 /srv/node/loop2 xfs noatime,nodiratime,nobarrier,logbufs=8 0 0" >> /etc/fstab
mount -a

chown swift:swift /srv/node/loop2
