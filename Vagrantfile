Vagrant.configure("2") do |config|
  config.vm.box="ubuntu/trusty64"
  config.vm.hostname="vagrant-machine"
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 5858, host: 5858
  config.vm.network "private_network", ip: "192.168.88.88"
  config.vm.synced_folder "app/nodeapp/", "/home/vagrant/nodeapp"
  config.vm.provision :shell, path:"bootstrap.sh"
end
