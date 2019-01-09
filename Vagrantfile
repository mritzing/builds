$bootstrap = <<BOOTSTRAP
        ## Dependencies
        #my bashrc file can remove if wanted
        sudo cp /vagrant/bootstrap/bashrc ~/.bashrc && source ~/.bashrc
BOOTSTRAP


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network :forwarded_port, host: 5432, guest: 5432
  config.vm.provision "shell", inline: $bootstrap
  config.vm.provision "shell",
        inline: "sudo /bin/sh /vagrant/bootstrap/testFile.sh"
end