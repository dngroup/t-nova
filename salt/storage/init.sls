gnupg:
  pkg.installed

aptitude:
  pkg.installed


base:
  pkgrepo.managed:
    - humanname: openstack ppa
    - name: deb http://ubuntu-cloud.archive.canonical.com/ubuntu/ trusty-updates/kilo main
    - file: /etc/apt/sources.list.d/cloudarchive-kilo.list



