{ inputs, config, lib, pkgs, ... }: {
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
    hostName = "krypton";
    hostId = "158b2654";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp1s0" ];
    interfaces.br0.useDHCP = true;
    useDHCP = false;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "23.11";
}
