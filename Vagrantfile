# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_VAULT="172.16.20.11"


Vagrant.configure("2") do |config|
  config.vm.provision "shell", env: {"IP_VAULT" => IP_VAULT}, 
                               inline: <<-SHELL
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install -y apt-transport-https ca-certificates curl jq
  SHELL

  config.vm.box = "ubuntu/jammy64"
  config.vm.box_check_update = true

  config.vm.define "vault" do |vault|
    vault.vm.hostname = "vault"
    vault.vm.network "private_network", ip: IP_VAULT
    vault.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 2
    end

    vault.vm.provision "shell", path: "scripts/vault.sh"
    vault.vm.provision "shell", path: "scripts/vault_unseal.sh", run: "always"
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
end