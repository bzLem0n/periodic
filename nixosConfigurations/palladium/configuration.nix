{ inputs, config, lib, pkgs, ... }: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "btrfs" ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      zfsSupport = true;
    };
  };

  networking = {
    hostName = "palladium";
    hostId = "03117a0c";
    firewall.enable = false;
    networkmanager.enable = true;
    useDHCP = false;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "23.11";
}

