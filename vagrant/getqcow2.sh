cd baseimg
vagrant destroy -f
TARGET_FILE=vm_$(date +%s).img
vagrant up
sleep 5
uuid=$(VBoxManage list vms |sed -rn "s/^\"([^\"]*).*/\1/p")
sleep 5
VBoxManage controlvm  $uuid acpipowerbutton
sleep 5
vmkd=$(VBoxManage showvminfo $uuid |sed -rn "s/^SATA[^/]*([^ ]*).*/\1/p")
sleep 5
cd ..
VBoxManage clonehd --format RAW $vmkd ./$TARGET_FILE
sleep 5
qemu-img convert -f raw ./$TARGET_FILE -O qcow2 ./vm.qcow2
sleep 5
rm $TARGET_FILE
	
