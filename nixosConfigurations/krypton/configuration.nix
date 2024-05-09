{ inputs, config, lib, pkgs, ... }: {
  boot = {
    initrd.systemd.enable = true;
    swraid.mdadmConf = "MAILADDR kevinwaynecrook@gmail.com";
    loader.systemd-boot.enable = lib.mkForce false;
    loader.efi.canTouchEfiVariables
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  networking = {
    hostName = "krypton";
    hostId = "158b2654";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp1s0" ];
    interfaces.br0.useDHCP = true;
    useDHCP = false;
  };

  system.stateVersion = "23.11";
}

