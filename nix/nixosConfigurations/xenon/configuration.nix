{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.extraPools = [ "zhdd" ];
  };

  networking = {
    hostName = "xenon";
    hostId = "27afeb2f";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp3s0" ];
    interfaces.br0.useDHCP = true;
    interfaces.br0.macAddress = "d0:50:99:aa:30:79";
    useDHCP = false;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "23.11";
}
