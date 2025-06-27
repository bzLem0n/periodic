{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    supportedFilesystems = [ "btrfs" ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      devices = [ "nodev" ];
    };
  };

  networking = {
    hostName = "nixusb";
    firewall.enable = false;
    networkmanager.enable = true;
    useDHCP = false;
  };

  hardware.enableRedistributableFirmware = true;

  system.stateVersion = "25.05";
}
