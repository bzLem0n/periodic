{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    supportedFilesystems = [ "btrfs" "zfs" ];
    loader.limine.efiInstallAsRemovable = true;
  };

  networking = {
    hostName = "nixusb";
    hostId = "8c696686";
    firewall.enable = false;
    networkmanager.enable = true;
    useDHCP = false;
  };

  hardware.enableRedistributableFirmware = true;

  system.stateVersion = "25.05";
}
