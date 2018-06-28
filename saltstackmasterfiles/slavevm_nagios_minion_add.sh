#!/bin/bash

echo -e "Please insert the nagios Minion IP 10.0.020"
read -p 'Nagios Minion IP: ' minion_ip

echo -e "Please insert the nagios minion hostname minion"
read -p 'Nagios Minion HostName: ' minion_name

#make a new template with the minionname as name of the .cfg file.
sudo mkdir /usr/local/nagios/etc/servers/
sudo touch /usr/local/nagios/etc/servers/"$minion_name".cfg

echo"
define host {
    use linux-server
    host_name $minion_name
    alias $minion_name
    address $minion_ip
    max_check_attempts 5
    check_period 24x7
    notification_interval 30
    notification_period 24x7
}

define service {
    use generic-service
    host_name $minion_name
    service_description CPU load
    check_command check_nrpe!check_load
}

define service {
    use generic-service
    host_name $minion_name
    service_description /dev/sda1 free space
    check_command check_nrpe!check_sda1
}" >> /usr/local/nagios/etc/servers/$minion_name.cfg
