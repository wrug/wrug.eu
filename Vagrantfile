# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
echo --- I am provisioning... ---
date > /etc/vagrant_provisioned_at
sudo apt-get install bundler -y
gem install RedCloth
echo --- Provisionning finished with success! ---
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # https://vagrantcloud.com/scalarae/boxes/jekyll
  config.vm.box = "scalarae/jekyll"

  # Configurate the virtual machine to use 2GB of RAM
  # If You have less free memory, then feel free to change value 2048 to something lower.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Jekyll server default port to the host
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  # Do the $script provisioning
  config.vm.provision "shell", inline: $script
end
