# linuxopdrachten

Stap 1: op masterVM

Install mastervm_saltstack

Stap 2: op minionVM

Install minion_saltstack

Stap 3: Op masterVM, accept all keys

sudo salt-key
sudo salt-key --accept-all

Stap 4: nagios installeren op de master

sudo salt 'salt' state.apply mastervm_nagios

Stap 5: nagios installeren op de minion


