{ inputs, config, lib, pkgs, ... }: {
  boot.swraid.mdadmConf = "MAILADDR kevinwaynecrook@gmail.com";

  networking = {
    hostName = "krypton";
    hostId = "158b2654";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp1s0" ];
    interfaces.br0.useDHCP = true;
    useDHCP = false;
  };

  peerix.nixosModules.peerix {
    services.peerix = {
      enable = true;
      #package = peerix.packages.x86_64-linux.peerix;
      openFirewall = true; # UDP/12304
      privateKeyFile = ./peerix-private;
      publicKeyFile =  ./peerix-public;
      #publicKey = "THE CONTENT OF peerix-public FROM THE OTHER COMPUTER";
      # example # publicKey = "peerix-laptop:1ZjzxYFhzeRMni4CyK2uKHjgo6xy0=";
    };
  }

  system.stateVersion = "23.11";
}

