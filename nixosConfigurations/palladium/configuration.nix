{ inputs, config, lib, pkgs, ... }: {
  boot = {
    supportedFilesystems = [ "btrfs" ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };

  networking = {
    hostName = "palladium";
    hostId = "03117a0c";
    firewall.enable = false;
    networkmanager.enable = true;
    useDHCP = false;
  };

  system.stateVersion = "23.11";
}

