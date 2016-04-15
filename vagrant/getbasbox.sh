cd baseimg
vagrant destroy -f
vagrant up
cd ..
uuid=$(VBoxManage list vms |sed -rn "s/^\"([^\"]*).*/\1/p")
VBoxManage controlvm  $uuid acpipowerbutton
rm package.box
vagrant package --base $uuid

#cd baseimg
#vagrant package --vagrantfile Vagrantfile
#mv package.box ../package.box
vagrant box remove ../package.box -f
