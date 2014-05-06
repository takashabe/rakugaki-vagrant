# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-64-minimal-with-chef"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network :public_network, ip: "192.168.33.100", bridge: "en0: Wi-Fi (AirPort)"
  config.vm.synced_folder "~/Development/rakugaki", "/opt/rakugaki", owner:"rakugaki", group:"rakugaki", type:"nfs"

  config.vm.provider "virtualbox" do |v|
    v.customize [ "modifyvm", :id, "--memory", "2048", "--cpus", "2"]
  end
end
