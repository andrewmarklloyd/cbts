# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "senglin/win-10-enterprise-vs2015community"
  config.vm.box_version = "1.0.0"
  config.vm.synced_folder "#{Dir.home}/Desktop/cbt_mount", "/Users/vagrant/Desktop/cbt_mount", create: true
  # disable network adapter?
  
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
end
