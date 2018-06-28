run slavevm_syslog_install:
 cmd:
 - run
 - name: /srv/salt/slavevm_syslog_install

replace master_ip:
 file.replace:
 - name: /etc/syslog-ng/syslog-ng.conf
 - pattern: MASTER_IP
 - repl: {{ grains['master'] }}

restart syslog-ng:
 cmd:
 - run
 - name: sudo systemctl syslog-ng restart
