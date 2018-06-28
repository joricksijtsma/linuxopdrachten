#install syslog-ng with saltstack

install_syslog_server:
 pkg.installed:
 - pkgs:
   - syslog-ng
   - syslog-ng-core

#copy the template
copy syslog-ng.conf:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf
 - source: /srv/salt/slavevm_syslog_server.conf
 - force: True

#restart syslog-ng to apply changes

restart syslog-ng:
 cmd:
 - run
 - name: systemctl restart syslog-ng
