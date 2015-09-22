Vagrant.configure("2") do |config|
  config.vm.box="ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.synced_folder "app/nodeapp/", "/home/vagrant/nodeapp"
  config.vm.synced_folder "temp/mongo_data/", "/mnt/data", create: true
  config.vm.synced_folder "temp/mongo_logs/", "/mnt/logs", create: true
  config.vm.provision :shell, path:"bootstrap.sh"
end
