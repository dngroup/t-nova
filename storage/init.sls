gitusername:
  git.config:
    - name: user.name
    - value: Nicolas Herbaut
    - user: root
    - is_global: True

gituseremail:
  git.config:
    - name: user.email
    - value: nherbaut@labri.fr
    - user: root
    - is_global: True


ubuntu-cloud-keyring:
  pkg.installed


base:
  pkgrepo.managed:
    - humanname: openstack ppa
    - name: deb http://ubuntu-cloud.archive.canonical.com/ubuntu/ trusty-updates/kilo main
    - file: /etc/apt/sources.list.d/cloudarchive-kilo.list



