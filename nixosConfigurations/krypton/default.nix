{ inputs, ... }: {
  system = "x86_64-linux";

  modules = [
    inputs.self.nixosModules.common
    #    inputs.self.nixosModules.desktop
    #    inputs.self.nixosModules.intelgpu
    inputs.self.nixosModules.libvirt
    inputs.self.nixosModules.podman

    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    #inputs.peerix.nixosModules.peerix
    #{
    #  services.peerix = {
    #    enable = true;
    #    package = inputs.peerix.packages.x86_64-linux.peerix;
    #    openFirewall = true; # UDP/12304
    #    privateKeyFile = ./peerix-private;
    #    publicKeyFile = ./peerix-public;
    #    #publicKey = "THE CONTENT OF peerix-public FROM THE OTHER COMPUTER";
    #    # example # publicKey = "peerix-laptop:1ZjzxYFhzeRMni4CyK2uKHjgo6xy0=";
    #  };
    #}

    ./configuration.nix
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
}
