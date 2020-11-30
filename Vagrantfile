# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Docker Container Runtime
  config.vm.define "minion1" do |minion|
    minion.vm.box = "ubuntu/xenial64"
    minion.vm.hostname = "minion1.example.com"
    minion.vm.network "private_network", ip: "172.16.1.101"
    minion.vm.provider "virtualbox" do |v|
      v.name = "minion1"
      v.memory = 2048
      v.cpus = 2
    end
  end
end
