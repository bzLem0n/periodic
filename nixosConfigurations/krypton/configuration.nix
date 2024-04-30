{ inputs, config, lib, pkgs, ... }: {
  boot = {
    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      mirroredBoots = [{
        devices = [ "/dev/disk/by-uuid/BDE6-9262" ];
        path = "/boot-fallback";
      }];
    };
    supportedFilesystems = [ "zfs" ];
  };

  networking = {
    hostName = "krypton";
    hostId = "158b2654";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  system.stateVersion = "23.11";
}

