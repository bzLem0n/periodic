{ inputs, config, lib, pkgs, ... }: {
  boot = {
    swraid.mdadmConf = "MAILADDR kevinwaynecrook@gmail.com";
    loader.grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
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

