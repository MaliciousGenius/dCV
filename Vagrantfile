# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "archlinux/archlinux"
    config.vm.box_check_update = false

    config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    config.vm.network "forwarded_port", guest: 80, host: 8080

    config.vm.provision "shell",
        inline: "pacman -Q 'python' || pacman -S 'python' --noconfirm"

    config.vm.provision :ansible do |ansible|
        ansible.playbook = "provision.yml"
    end

    config.vm.provider "virtualbox" do |vb|
        vm.cpus = "1"
        vb.memory = "128"
        vb.gui = false
  end
end
