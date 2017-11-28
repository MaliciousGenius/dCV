# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.hostname = "dcv-test.local"
    config.vm.box = "ubuntu/xenial64"
    config.vm.box_check_update = false

    config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    config.vm.network "forwarded_port", guest: 8000, host: 8000

    config.vm.provision :ansible do |ansible|
        ansible.playbook = "provision.yml"
    end

    config.vm.provider "virtualbox" do |vm|
        vm.cpus = "1"
        vm.memory = "512"
        vm.gui = false
  end
end
