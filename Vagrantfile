Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: $script
    config.vm.boot_timeout = 1000
    config.vm.define "vm" do |vm|
        vm.vm.box = "bento/ubuntu-20.04"
        vm.vm.hostname= "master"
        vm.vm.network "private_network", ip: "192.168.50.1"
        vm.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
            v.gui = true
        end
    end
end
    