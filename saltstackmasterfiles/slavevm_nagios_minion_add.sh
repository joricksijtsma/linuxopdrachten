#!/bin/bash

echo -e "Please insert the nagios Minion IP 10.0.0.28"
read -p 'Nagios Minion IP: ' minion_ip

echo -e "Please insert the nagios minion hostname minion"
read -p 'Nagios Minion HostName: ' minion_name

sudo mkdir /usr/local/nagios/etc/servers/
sudo touch /usr/local/nagios/etc/servers/"$minion_name".cfg
echo "
define host {
	use			linux-server
	host_name		$minion_name
  alias			  $minion_name
	address			$minion_ip
	max_check_attempts	5
	check_period		24x7
	notification_interval	30
	notification_period	24x7
}

define service {
	use			generic-service
	host_name		$minion_name
	service_description	CPU load
	check_command		check_nrpe!check_load
}

#define service {
#	use			generic-service
#	host_name		$minion_name
#	service_description	/dev/hda1 free space
#	check_command		check_nrpe!check_hda1
#}
" | sudo tee -a /usr/local/nagios/etc/servers/$minion_name.cfg
sudo systemctl restart nagios
