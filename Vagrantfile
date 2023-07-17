Vagrant.configure("2") do |config|
    config.vm.define "master-k8s" do |v|
        v.vm.box = "bento/ubuntu-20.04"
        v.vm.hostname= "master-k8s"
        v.vm.network "private_network", ip: "192.168.50.20"
        v.vm.provision "shell", path: "provision.sh"
        v.vm.provider "vmware_desktop" do |v|
            v.memory = 4096
            v.cpus = 2
            v.gui = true
        end
    end
end
    