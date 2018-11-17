## Packer template for Vagrant
A [Packer](https://www.packer.io) Templates for creating a [Vagrant](http://vagrantup.com/) CentOS box.
This template uses a custom SSH key instead of the default random or insecure key.

### Usage
1. Generate your SSH key-pair using:

   ```bash
   ssh-keygen -t rsa -b 4096
   ```
2. Export the required environment variables:

   ```bash
   $ export vagrant_private_key = /path/to/private/key
   $ export vagrant_public_key = /path/to/public/key
   ```

3. Edit the template file to include the path to the ISO file and its checksum. Also, edit the installer script to provision the Vagrant box with the tools you need.

   ```bash
   $ vi centos-7-virtualbox.json
   $ vi installer.sh
   ```
4. Build the image

   ```bash
   $ packer build -var "user=vagrant" -var "password=vagrant" -var "public_key=/path/to/public/key" -var "private_key=/path/to/private/key" ./centos-7-virtualbox.json 
   ``` 

5. Create the Vagrant box from the image

   ```bash
   $ vagrant up
   ``` 

6. Log in to the Vagrant box using ssh

   ```bash
   $ vagrant ssh
   ``` 

   ### License
   MIT