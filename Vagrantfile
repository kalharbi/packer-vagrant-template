# -*- mode: ruby -*-
# vi: set ft=ruby :
user_name = ENV['vagrant_user'] or 'vagrant'
private_key_path = ENV['vagrant_private_key']
public_key_path = ENV['vagrant_public_key']

if private_key_path == ''
  puts("Missing private key")
  exit(1)
elif public_key_path == ''
  puts("Missing public key")
  exit(1)
end

Vagrant.configure("2") do |config|
  config.vm.box_check_update = true
  config.vm.box = "centos-7-vagrant"
  config.vm.box_url = "file://./builds/virtualbox-centos7.box"
  config.vm.hostname = "virtualbox-centos7"
  config.ssh.host = "127.0.0.1"
  config.ssh.port = 2222
  config.ssh.private_key_path = [private_key_path]
  config.ssh.insert_key = false
  config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "127.0.0.1", id: 'ssh'
  config.vm.provision "shell", path: "./set_ssh.sh", args: "#{user_name} #{public_key_path}"
  
  config.vm.provider :virtualbox do |vbox|
     vbox.gui = false
     vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
     vbox.customize ["modifyvm", :id, "--ioapic", "on"]
     vbox.name = "centos-7-vagrant"
  end

end