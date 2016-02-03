import subprocess
import json
import paramiko

with open("data.json") as f:
  data=json.loads(f.read())

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())


masterIp=data["Controller"]

ssh.connect(masterIp,username="root")


stdin, stdout, stderr = ssh.exec_command('apt-get install salt-master --yes')
print stdout.read()

stdin, stdout, stderr = ssh.exec_command('echo "fileserver_backend:" >> /etc/salt/master')
print stdout.read()
stdin, stdout, stderr = ssh.exec_command('echo "  - roots" >> /etc/salt/master')
print stdout.read()
stdin, stdout, stderr = ssh.exec_command('echo "  - minion" >> /etc/salt/master')
print stdout.read()
stdin, stdout, stderr = ssh.exec_command('echo "  - git" >> /etc/salt/master')
print stdout.read()
stdin, stdout, stderr = ssh.exec_command('echo "" >> /etc/salt/master')
print stdout.read()
stdin, stdout, stderr = ssh.exec_command('echo "file_recv: True" >> /etc/salt/master')
print stdout.read()


stdin, stdout, stderr = ssh.exec_command('echo "auto_accept: True" >> /etc/salt/master')
print stdout.read()
stdin, stdout, stderr = ssh.exec_command('echo "open_mode: True" >> /etc/salt/master')
print stdout.read()

stdin, stdout, stderr = ssh.exec_command('service salt-master restart')
print stdout.read()


for (name, ip) in data.items():
    print name, " ", ip
    ssh.connect(ip,username="root")
    
    
    stdin, stdout, stderr = ssh.exec_command("wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -")
    print stdout.read()
    stdin, stdout, stderr = ssh.exec_command("apt-get update")
    print stdout.read()
    
    stdin, stdout, stderr = ssh.exec_command("apt-get install salt-minion --yes")
    print stdout.read()
    
    stdin, stdout, stderr = ssh.exec_command('echo "minion_%s" > /etc/salt/minion_id'%name)
    #for everbody
    
    stdin, stdout, stderr = ssh.exec_command("echo %s salt >> /etc/hosts" % masterIp)
    print stdout.read()
        
    stdin, stdout, stderr = ssh.exec_command("service salt-minion restart")
    print stdout.read()
    
    
    
    
    
