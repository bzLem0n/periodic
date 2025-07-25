{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "zfs" ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      zfsSupport = true;
    };
  };

  networking = {
    hostName = "zinc";
    hostId = "983ee865";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp2s0" ];
    interfaces.br0.useDHCP = true;
    interfaces.br0.macAddress = "f8:bc:12:80:1f:e8";
    useDHCP = false;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "23.11";
}
