Vagrant.configure(2) do |config|

  config.vm.box = "pyama/wdb-ruby-2.3"

  config.vm.define :app01 do |c|
    c.vm.hostname = "app01"
    c.vm.network "private_network", ip:"192.168.50.21"
    c.vm.synced_folder "./",
    "/var/www/todo", nfs:true
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 512]
      vbox.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  config.vm.define :app02 do |c|
    c.vm.hostname = "app02"
    c.vm.network "private_network", ip:"192.168.50.22"
    c.vm.synced_folder "./",
    "/var/www/todo", nfs:true
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 512]
      vbox.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  config.vm.define :db01 do |c|
    c.vm.hostname = "db01"
    c.vm.network "private_network", ip:"192.168.50.31"
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 1024]
      vbox.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

end
