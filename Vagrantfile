Vagrant.configure("2") do |config|
  config.vm.box="ubuntu/trusty64"
  config.vm.hostname="vagrant-machine"
  config.vm.network "forwarded_port", guest: 9000, host: 9000 # Express
  config.vm.network "forwarded_port", guest: 5858, host: 5858 # Debugger
  config.vm.network "forwarded_port", guest: 35729, host: 35729 # livereload port
  config.vm.network "private_network", ip: "192.168.88.88"
  config.vm.synced_folder "app/webapp/", "/home/vagrant/webapp"
  config.vm.provision :shell, path:"bootstrap.sh"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048 # Docker-ot needs lots of memory, so does running `grunt serve` concurrently.
    v.cpus = 2
    # Fixed slow network connection speed
    # http://superuser.com/questions/850357/how-to-fix-extremely-slow-virtualbox-network-download-speed
    v.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end
end
