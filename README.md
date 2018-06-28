# linuxopdrachten

# ALLE HARDCODED IP ADRESSEN AANPASSEN ( slavevm_nagios(2x), slavevm_nagios_minion_add )
sudo git clone https://github.com/joricksijtsma/linuxopdrachten

#alles executable maken
cd linuxopdrachten

sudo chmod 777 mastervm_saltstack minion_saltstack

cd saltstackmasterfiles

sudo chmod 777 mastervm_nagios slavevm_nagios slavevm_nagios_minion_add.sh


Stap 1: op masterVM
cd ..
sudo ./mastervm_saltstack

Stap 2: op minionVM
cd ..
sudo ./minion_saltstack

Stap 3: Op masterVM, accept all keys

sudo salt-key
sudo salt-key --accept-all

Stap 4: alles installeren op de master(nagios, syslog, etc)

sudo salt 'salt' state.apply -t 900 mastervm_nagios
sudo salt 'salt' state.apply mastervm_syslog #moet nog gemaakt worden

Stap 5: alles installeren op de minion(nagios, syslog, etc)

sudo salt 'minion' state.apply -t 60 slavevm_nagios
sudo salt 'minion' state.apply slavevm_syslog #moet nog gemaakt worden

Stap 6: add minion to mastervm_nagios website

slavevm_nagios_minion_add.sh
