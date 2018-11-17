#!/bin/bash
# Exit immediately if any command exits with a non-zero exit status.
echo "Setting up SSH..."
set -e
# usage
if [[ $# -ne 2 ]]
  then
    echo "Error: Usage $0 user_name public_key"
    exit 1
fi
# Disable SSH password-based authentication
sed -n 'H;${x;s/\#PasswordAuthentication yes/PasswordAuthentication no/;p;}' /etc/ssh/sshd_config > new_sshd_config
cat new_sshd_config > /etc/ssh/sshd_config
rm new_sshd_config
# move the public key
mkdir -p /home/$1/.ssh
mv $2 /home/$1/.ssh/authorized_keys
chmod 700 /home/$1/.ssh
chown -R $1:$1 /home/$1/.ssh
chmod 644 /home/$1/.ssh/authorized_keys
