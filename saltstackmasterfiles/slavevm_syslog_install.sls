#install syslog-ng
install_syslog_server:
 pkg.installed:
 - pkgs:
   - syslog-ng
   - syslog-ng-core

copy syslog-ng.conf:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf
 - source: /srv/salt/slavevm_syslog_client.conf
 - force: True

replace master_ip:
 file.replace:
 - name: /etc/syslog-ng/syslog-ng.conf
 - pattern: MASTER_IP
 - repl: 10.0.0.26

restart syslog-ng:
 cmd:
 - run
 - name: sudo systemctl restart syslog-ng
