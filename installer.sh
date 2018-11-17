#!/bin/bash
# You must execute this shell script as a root user
# Exit immediately if any command exits with a non-zero exit status.
set -e
echo "Installing software"
#yum update -y
# Install nano text editor
yum -y install nano
# Install Apache httpd
#yum -y install httpd
# Change Apache root directory ownership
#chown apache:apache /var/www/html
# SELinux security context
#chcon -Rt httpd_sys_content_t /var/www/html
#setsebool -P httpd_can_network_connect on
# Install PHP 7.2
#yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
#yum -y install yum-utils
#yum-config-manager --enable remi-php72
#yum -y install php
# Install MariaDB 10.1
#sudo printf "[mariadb]\nname = MariaDB\nbaseurl = http://yum.mariadb.org/10.1/centos7-amd64\ngpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB\ngpgcheck = 1\n" | sudo tee /etc/yum.repos.d/MariaDB.repo
#yum -y install MariaDB-server MariaDB-client
# Clean the cache
yum clean all