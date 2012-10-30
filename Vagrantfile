################################################################################
# This file is used to produce a Vagrant VM that will be provisioned to host   #
# this project. [http://vagrantup.com/]                                        #
################################################################################

Vagrant::Config.run do |config|

    # Use LAMP basebox [see https://github.com/deframe/Vagrant-Baseboxes]

    config.vm.box = "lamp"

    # Initialize host-only networking.

    config.vm.network :hostonly, "10.0.1.10"

    # Forward HTTP requests.

    config.vm.forward_port 80, 8080

    # Share folders.

    config.vm.share_folder "default-site", "/web/default", "./"

    # Provision the box with a shell script.

    Vagrant::Config.run do |config|
        config.vm.provision :shell, :path => "provision-vagrant-vm.sh"
    end

end