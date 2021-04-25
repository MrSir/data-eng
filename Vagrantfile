# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "geerlingguy/ubuntu1804"

  config.vm.hostname = "data-eng"
  config.vm.network :forwarded_port, guest: 80, host: 8054, auto_correct: true
  config.vm.network :forwarded_port, guest: 3306, host: 9954, auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2354, auto_correct: true
  config.vm.network "private_network", ip: "192.168.10.154"

  config.ssh.forward_agent = true

  config.winnfsd.uid = 1
  config.winnfsd.gid = 1

  config.vm.synced_folder "./", "/var/www", nfs: true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    vb.customize ["modifyvm", :id, "--name", "data-eng"]
    vb.customize ["modifyvm", :id, "--memory", "2024"]
    vb.customize ["modifyvm", :id, "--vram", "12"]
  end

  config.vm.provision :shell, :path=>"base_script.sh"

end