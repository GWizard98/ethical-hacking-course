# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "ehc-lab"
  # NAT only; comment host-only if needed for isolation
  # config.vm.network "private_network", type: "dhcp"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
  config.vm.provision "shell", inline: <<-SHELL
    set -e
    sudo apt-get update -y
    sudo apt-get install -y tmux curl wget jq unzip
  SHELL
end
