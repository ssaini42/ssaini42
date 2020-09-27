#!/bin/bash

echo "Latest information of the system as on `date`."
echo
echo "Hostname: "
hostname
echo


#disk/partition size, usage, and mount points
echo Disk Space Utilization:
df -mh
echo 


# network devices (name)
echo Network devices:
nmcli device
echo 


#IP address, broadcast, and netmask for each active device
echo "IP address of the active devices: "
ip a | grep 'Link\|inet'
echo


#OS version/release level, kernel version used
echo The OS version is `uname -or` running on a `uname -m` processor.
echo


#security mode (SELinux status)
echo The SElinux status: 
getenforce
echo


#firewall configuration
echo "Firewall configuration: "
firewall-cmd --list-all
echo


#list of active repositories
echo "List of enabled repositories:"
yum repolist
echo


#number of software packages (rpm, deb, etc) installed
echo "Number of software packages installed on the system: "
yum list installed | wc -l
echo


#name of software packages installed
echo "List of software packages installed on the system"
yum list installed
echo


#dns server configured (which dns server(s) will be used for the local resolver)
echo "IP of the DNS server being used: "
grep "nameserver" /etc/resolv.conf
echo


#Currently active (shell) users.
echo Following users are presently active: 
w | cut -d ' ' -f 1 | grep -v USER | sort -u
echo


#date the os was first installed
echo "Date the OS was first installed: "
rpm -qi basesystem | grep Install
echo


#hardware details: cpu, main memory size, swap memory configure, devices, etc.
echo "Hardware details: "
lscpu
echo


#currently running services
echo "The services that are currently running are: "
systemctl | grep running
echo


#services installed but not running
echo "The services that are installed on the system but are not running are: "
systemctl --all | grep inactive
echo

