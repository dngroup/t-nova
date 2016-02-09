gnupg:
  pkg.installed

aptitude:
  pkg.installed


base:
  pkgrepo.managed:
    - humanname: Jessie Backport
    - name: deb http://http.debian.net/debian jessie-backports main



