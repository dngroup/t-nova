This folder contains tools to generate qcow2 images for the vhg/vcdn vnf. 

Qcow2 images are created by installing everything we need in a virtualbox VM, and exporting it as a qcow2 image.
The creation of the virtualbox VM itselft is automated and versionned using using vagrant.

the creation of the qcow2 is done within a docker container, so everything can be fully automated.

As a summary Docker --run--> Vagrant --create-vm--> VirtualBox --export--> QCow2


--

