Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.box = "centos/7"
    config.vm.provider "virtualbox" do |vb|

        vb.name = "hadoop1"
  end
 #Hadoop-Master1
  config.vm.define "hadoop1", primary: true do |master|
    master.vm.network "private_network", ip: "192.168.55.75"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "hadoop1"
      vb.memory = 2048
      vb.cpus = 1
    end
    master.vm.hostname = "hadoop1"
  end

 #Hadoop-master2
  config.vm.define "hadoop2" do |agent|
    agent.vm.network "private_network", ip: "192.168.55.76"
    agent.vm.provider "virtualbox" do |vb|
      vb.name = "hadoop2"
      vb.memory = 2048
      vb.cpus = 1
    end
    agent.vm.hostname = "hadoop2"
  end

end
