# linuxopdrachten

# ALLE HARDCODED IP ADRESSEN AANPASSEN:

# slavevm_nagios    regel 39 & 43
# slavevm_syslog_install regel 18

sudo git clone https://github.com/joricksijtsma/linuxopdrachten && cd linuxopdrachten && sudo chmod 777 mastervm_saltstack minion_saltstack && cd saltstackmasterfiles && sudo chmod 777 mastervm_nagios slavevm_nagios slavevm_nagios_minion_add.sh

# cd / && sudo rm -rf linuxopdrachten

Stap 1: op masterVM
cd .. && sudo ./mastervm_saltstack
cd /srv/salt && ls

Stap 2: op minionVM
cd .. && sudo ./minion_saltstack
cd /srv/salt && ls

Stap 3: Op masterVM, accept all keys

sudo salt-key
sudo salt-key --accept-all

Stap 4: alles installeren op de master(nagios, syslog, docker)

sudo salt 'salt*' state.apply -t 60 mastervm_nagios
sudo salt 'salt*' state.apply -t 60 mastervm_syslog_install
sudo salt 'salt*' state.apply -t 60 docker_install

# sudo apt-get purge --auto-remove syslog-ng  |

Stap 5: alles installeren op de minion(nagios, syslog, etc)

sudo salt 'minion*' state.apply -t 60 slavevm_nagios
sudo salt 'minion*' state.apply -t 60 slavevm_syslog_install
sudo salt 'minion*' state.apply -t 60 docker_install

Stap 6: add minion to mastervm_nagios website
cd /srv/salt
sudo chmod 777 slavevm_nagios_minion_add.sh
sudo ./slavevm_nagios_minion_add.sh
