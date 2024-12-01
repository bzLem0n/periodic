{ inputs, config, lib, pkgs, ... }: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "zfs" ];
    zfs.extraPools = [ "zhdd" ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      zfsSupport = true;
      mirroredBoots = [
        {
          devices =
            [ "/dev/disk/by-id/ata-Samsung_SSD_850_EVO_500GB_S2RANXAH180187P" ];
          path = "/boot";
        }
        {
          devices = [ "/dev/disk/by-id/nvme-WDS500G2X0C-00L350_183055423956" ];
          path = "/boot-fallback";
        }
      ];
    };
  };

  networking = {
    hostName = "xenon";
    hostId = "27afeb2f";
    firewall.enable = false;
    bridges.br0.interfaces = [ "enp3s0" ];
    interfaces.br0.useDHCP = true;
    useDHCP = false;
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  system.stateVersion = "23.11";
}
