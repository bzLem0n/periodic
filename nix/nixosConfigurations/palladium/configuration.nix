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
    kernelParams = [ "mitigations=off" ];
    loader.limine.efiInstallAsRemovable = true;
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
