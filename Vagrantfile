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

  # config.vm.define :app02 do |c|
  #   c.vm.hostname = "app02"
  #   c.vm.network "private_network", ip:"192.168.50.22"
  #   c.vm.synced_folder "./",
  #   "/var/www/todo", nfs:true
  #   c.vm.provider :virtualbox do |vbox|
  #     vbox.customize ["modifyvm", :id, "--memory", 512]
  #     vbox.customize ["modifyvm", :id, "--cpus", 2]
  #   end
  # end

  config.vm.define :db01 do |c|
    c.vm.hostname = "db01"
    c.vm.network "private_network", ip:"192.168.50.31"
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 1024]
      vbox.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  config.vm.define :proxy01 do |c|
    c.vm.hostname = "proxy01"
    c.vm.network "private_network", ip:"192.168.51.11", virtualbox__intnet: "internal_net"
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 256]
      vbox.customize ["modifyvm", :id, "--cpus", 1]
    end
  end

  # config.vm.define :proxy02 do |c|
  #   c.vm.hostname = "proxy02"
  #   c.vm.network "private_network", ip:"192.168.50.12"
  #   c.vm.provider :virtualbox do |vbox|
  #     vbox.customize ["modifyvm", :id, "--memory", 256]
  #     vbox.customize ["modifyvm", :id, "--cpus", 1]
  #   end
  # end

  config.vm.define :lb01 do |c|
    c.vm.hostname = "lb01"
    c.vm.network "private_network", ip:"192.168.50.41"
    c.vm.network "private_network", ip:"192.168.51.41", virtualbox__intnet: "internal_net"
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 256]
      vbox.customize ["modifyvm", :id, "--cpus", 1]
    end
  end

  config.vm.define :lb02 do |c|
    c.vm.hostname = "lb01"
    c.vm.network "private_network", ip:"192.168.50.42"
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", 256]
      vbox.customize ["modifyvm", :id, "--cpus", 1]
    end
  end

end
