{ inputs
, config
, lib
, pkgs
, ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };
  };

  networking = {
    hostName = "silver";
    hostId = "c4183603";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp7s0" ];
    interfaces.br0.useDHCP = true;
    interfaces.br0.macAddress = "70:85:c2:3c:4a:08";
    useDHCP = false;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "25.05";
}
