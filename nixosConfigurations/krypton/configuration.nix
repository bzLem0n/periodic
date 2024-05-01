{ inputs, config, lib, pkgs, ... }: {
  boot = {
    supportedFilesystems = [ "zfs" ];
    initrd.secrets = { "/zssd.key" = /zssd.key; };

    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      mirroredBoots = [{
        devices = [ "/dev/disk/by-uuid/BDE6-9262" ];
        path = "/boot-fallback";
      }];
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

  services.zfs.autoScrub.enable = true;

  powerManagement.cpuFreqGovernor = "ondemand";

  virtualisation.podman.extraPackages = [ pkgs.zfs ];

  system.stateVersion = "23.11";
}

